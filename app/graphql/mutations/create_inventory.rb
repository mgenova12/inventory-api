class Mutations::CreateInventory < Mutations::BaseMutation
  argument :store_id, Integer, required: true

  field :inventory, [Types::InventoryType], null: false
  field :errors, [String], null: false

  def resolve(store_id:)
    store_goods = Store.find(store_id).store_goods

    store_goods.each do |store_good|
      Inventory.create!(
        store_good_id: store_good.id, 
        status: 'pending', 
        store_id: store_id, 
        location_id: store_good.location_id
      )
    end

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