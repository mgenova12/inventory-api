class Product < ApplicationRecord
  belongs_to :distributor, optional: true
  belongs_to :category
  has_many :documents
  attr_accessor :document_data
  has_many :store_goods

  def store_invetory_amount(store_order_id, store_id)
    product = self
    orders = StoreOrder.find(store_order_id).orders
    store = Store.find(store_id)

    details = {
      product: product.name,
      stores: []
    }

    total = 0
    orders.each do |order|

      store_good = order.store.store_goods.find_by(product_id: product.id)

      if store_good
        inventory = order.inventories.find_by(store_good_id: store_good.id)
        needed = inventory&.quantity_needed || 0
        total += needed
        details[:stores] << {order.store.name => needed}
      end 
        stock = store.store_goods.find_by(product_id: product.id).amount_in_stock
        details['on_hand'] = stock
    end
    details['total'] = total
    details['need'] = total - details['on_hand']
    return details
  end
  

  def self.prepcenter_inventory_amount(store_order_id, store_id)
    products = Store.find(store_id).products

    products.map do |product|
      product.store_invetory_amount(store_order_id, store_id)
    end


  end

end
