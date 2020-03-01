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
    inventory.update(scanned: true)

    {
      inventory: inventory,
      errors: []
    }

  end


end