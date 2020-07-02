module Queries
  class GetCombinded < Queries::BaseQuery
    argument :store_order_id, Integer, required: true
    argument :store_id, Integer, required: true
    
    description 'Find GetCombinded'

    type [Types::CombindedType], null: false

    def resolve(store_order_id:, store_id:)
      Product.prepcenter_inventory_amount(store_order_id, store_id)
    end
  end

end
