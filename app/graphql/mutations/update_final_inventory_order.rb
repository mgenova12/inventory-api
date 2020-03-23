class Mutations::UpdateFinalInventoryOrder < Mutations::BaseMutation

  argument :order_id, Integer, required: true
  argument :store_order_id, Integer, required: true

  field :errors, [String], null: false

  def resolve(order_id:, store_order_id:)
    order = Order.find(order_id)
    store_order = StoreOrder.find(store_order_id)

    if store_order.orders_complete >= 3
      store_order.update(status: 'Delivered')
    end

    sale_total = 0
    order.inventories.where(scanned: true).each do |inventory|
      if inventory.store_good.distributor.name == 'Trappe'
        sale_total += inventory.store_good.product.price
      end
    end 

    order.update(sale_total: sale_total, status: 'complete')

    {
      errors: []
    }

  end


end