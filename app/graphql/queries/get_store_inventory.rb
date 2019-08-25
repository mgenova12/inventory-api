module Queries
  class GetStoreInventory < Queries::BaseQuery
    argument :store_id, Integer, required: true
    
    description 'Find a Store Inventory'

    type Types::OrderType, null: true

    def resolve(store_id:)
      Order.find_by(store_id: store_id, status: 'incomplete')
    end
  end

end
