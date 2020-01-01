class Mutations::CreateInventory < Mutations::BaseMutation
  argument :store_id, Integer, required: true
  argument :delivery_day, String, required: true

  field :inventory, [Types::InventoryType], null: true
  field :errors, [String], null: false

  def resolve(store_id:, delivery_day:) 
    store_type = Store.find(store_id).store_type.name
    store_goods = Store.find(store_id).store_goods

    if delivery_day == 'Tuesday'
      date = Date.today
      delivery_date = date += 1 + ((2-date.wday) % 7)
    else
      date = Date.today
      delivery_date = date += 1 + ((5-date.wday) % 7)
    end
    
    if ['true', 'false'].include?(delivery_day)
      order = Order.create!(store_id: store_id, delivery_day: delivery_day, status: 'incomplete')
    elsif StoreOrder.last.nil? || StoreOrder.last&.orders_complete == StoreType.find_by(name:'Restaurant').stores.size
      store_order = StoreOrder.create!(delivery_date: delivery_date, orders_complete: 1)
      order = Order.create!(store_id: store_id, delivery_day: delivery_day, status: 'incomplete', store_order_id: store_order.id)
    else 
      store_order = StoreOrder.last
      store_order.increment!(:orders_complete, 1)
      order = Order.create!(store_id: store_id, delivery_day: delivery_day, status: 'incomplete', store_order_id: store_order.id)
    end


    #add row_order to store_good for row order in inventory
    store_goods.each do |store_good|
      if store_type == 'Prepcenter'
        if store_good.product.prepped.to_s == delivery_day
          Inventory.create!(
            store_good_id: store_good.id, 
            status: 'pending', 
            store_id: store_id, 
            location_id: store_good.location_id,
            order_id: order.id
          )
        end
      else
        if store_good.delivery_day == delivery_day || store_good.delivery_day == 'Both'
          Inventory.create!(
            store_good_id: store_good.id, 
            status: 'pending', 
            store_id: store_id, 
            location_id: store_good.location_id,
            order_id: order.id
          )
        end
      end
    end

    {
      errors: []
    }
    # if inventory.save
    #   # Successful creation, return the created object with no errors
    #   {
    #     inventory: inventory,
    #     errors: [],
    #   }
    # else
    #   # Failed save, return the errors to the client
    #   {
    #     inventory: nil,
    #     errors: inventory.errors.full_messages
    #   }
    # end

  end


end