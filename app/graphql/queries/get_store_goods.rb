module Queries
  class GetStoreGoods < Queries::BaseQuery
    argument :id, Integer, required: true
    
    description 'Find all Store Goods'

    type [Types::ProductType], null: false

    def resolve(id:)
      Store.find(id).products
    end
  end

end