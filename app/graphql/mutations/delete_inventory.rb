class Mutations::DeleteInventory < Mutations::BaseMutation
  argument :store_id, Integer, required: true

  field :errors, [String], null: false

  def resolve(store_id:)
    inventories = Inventory.where(store_id: store_id, status: 'pending')
    order_id = inventories.first.order_id
    if Order.find(order_id).destroy
      inventories.delete_all
    end

    {
      errors: []
    }

  end


end