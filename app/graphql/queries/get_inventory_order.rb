module Queries
  class GetInventoryOrder < Queries::BaseQuery
    argument :order_id, Integer, required: true
    
    description 'Find a Inventory Order'

    type [Types::InventoryType], null: false

    def resolve(order_id:)
      Order.find(order_id).inventories
    end
  end

end