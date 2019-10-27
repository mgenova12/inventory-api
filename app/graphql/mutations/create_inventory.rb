class Mutations::CreateInventory < Mutations::BaseMutation
  argument :store_id, Integer, required: true
  argument :delivery_day, String, required: true

  field :inventory, [Types::InventoryType], null: true
  field :errors, [String], null: false

  def resolve(store_id:, delivery_day:) 
    store_type = Store.find(store_id).store_type.name
    store_goods = Store.find(store_id).store_goods
    order = Order.create!(store_id: store_id, delivery_day: delivery_day, status: 'incomplete')

    #add row_order to store_good for row order in inventory
    store_goods.each do |store_good|
      if store_type === 'Prepcenter'
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