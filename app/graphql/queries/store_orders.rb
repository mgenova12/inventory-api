module Queries
  class StoreOrders < Queries::BaseQuery
    argument :store_id, Integer, required: true

    description 'Find all orders'

    type [Types::OrderType], null: false

    def resolve(store_id:)

      store_type = Store.find(store_id).store_type.name

      if store_type === 'Prepcenter'
        Order.where.not(store_id: store_id).reverse
      end
      
    end
    
  end
end