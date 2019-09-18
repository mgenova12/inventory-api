class Mutations::EditInventoryQuantityNeeded < Mutations::BaseMutation
  argument :store_id, Integer, required: true

  field :order_id, Integer, null: false
  field :errors, [String], null: false

  def resolve(store_id:)
    inventories = Inventory.where(store_id: store_id, status: 'pending')
    order_id = inventories.first.order_id
    Order.find(order_id).update(status: 'pending')
    
    inventories.each do |inventory|
      if inventory.store_good.count_by.name == '%'
        inventory.quantity <= 25 ? inventory.update(quantity_needed: 1, status: 'complete') : inventory.update(quantity_needed: 0, status: 'complete')
      elsif inventory.store_good.replenish_by_each
        result = inventory.store_good.max_amount - inventory.quantity
        result > 0 ? inventory.update(quantity_needed: result, status: 'complete') : inventory.update(quantity_needed: 0, status: 'complete')
      elsif inventory.store_good.product.case_quantity && inventory.store_good.product.case_quantity > 0 && inventory.store_good.count_by.name == 'EA' && inventory.store_good.replenish_by == 'CASE'
        case_amount = inventory.store_good.max_amount - inventory.quantity
        case_result = (case_amount.to_f / inventory.store_good.product.case_quantity.to_f).ceil
        case_result > 0 ? inventory.update(quantity_needed: case_result, status: 'complete') : inventory.update(quantity_needed: 0, status: 'complete')
      else
        result = inventory.store_good.max_amount - inventory.quantity
        result > 0 ? inventory.update(quantity_needed: result, status: 'complete') : inventory.update(quantity_needed: 0, status: 'complete')
      end
    end
    
    {
      errors: [],
      order_id: order_id
    }

  end
end






