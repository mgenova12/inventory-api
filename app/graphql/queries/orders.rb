module Queries
  class Orders < Queries::BaseQuery
    argument :store_id, Integer, required: true

    description 'Find all orders'

    type [Types::OrderType], null: false

    def resolve(store_id:)

      Order.all.reverse
    end
  end
end