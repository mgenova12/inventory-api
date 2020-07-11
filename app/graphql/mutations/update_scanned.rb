class Mutations::UpdateScanned < Mutations::BaseMutation
  argument :barcode, Integer, required: true
  argument :store_id, Integer, required: true
  argument :order_id, Integer, required: true

  field :inventory, Types::InventoryType, null: false
  field :errors, [String], null: false

  def resolve(barcode:, store_id:, order_id:)
    product_id = Product.find_by(barcode: barcode).id
    store_good_id = StoreGood.find_by(product_id: product_id, store_id: store_id).id
    inventory = Inventory.find_by(order_id: order_id, store_id: store_id, store_good_id: store_good_id)
    
    quantity_needed = inventory.quantity_needed - 1
    invoiced_quantity = inventory.invoiced_quantity + 1
    inventory.update(scanned: true, quantity_needed: quantity_needed, invoiced_quantity: invoiced_quantity)

    {
      inventory: inventory,
      errors: []
    }

  end


end