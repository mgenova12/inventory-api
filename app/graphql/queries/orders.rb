module Queries
  class Orders < Queries::BaseQuery
    argument :store_id, Integer, required: false

    description 'Find all orders'

    type [Types::OrderType], null: false

    def resolve(store_id:)
      if store_id
        Order.where(store_id: store_id).reverse
      else 
        Order.all.reverse
      end

    end
    
  end
end