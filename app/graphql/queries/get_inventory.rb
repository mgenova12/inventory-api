module Queries
  class GetInventory < Queries::BaseQuery
    argument :store_id, Integer, required: true
    
    description 'Find a Inventory'

    type [Types::InventoryPendingType], null: false

    def resolve(store_id:)
      Location.where(store_id: store_id)
    end
  end

end
