module Queries
  class GetRemovedStoreGoods < Queries::BaseQuery
    argument :id, Integer, required: true
    
    description 'Find all Removed Store Goods'

    type [Types::ProductType], null: false

    def resolve(id:)
      Product.all - Store.find(id).products
    end
  end

end