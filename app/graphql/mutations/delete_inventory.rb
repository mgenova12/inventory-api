class Mutations::DeleteInventory < Mutations::BaseMutation
  argument :store_id, Integer, required: true

  field :errors, [String], null: false

  def resolve(store_id:)
    inventories = Inventory.where(store_id: store_id, status: 'pending')
    order_id = inventories.first.order_id

    order = Order.find(order_id)
    order.store_order.decrement!(:orders_complete, 1)

    if order.store_order.orders_complete == 0 
      order.store_order.destroy
    end

    if order.destroy
      inventories.delete_all
    end


    {
      errors: []
    }

  end


end