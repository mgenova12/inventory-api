module Queries
  class GetStoreGoods < Queries::BaseQuery
    argument :id, Integer, required: true
    
    description 'Find all Store Goods'

    type [Types::StoreGoodType], null: false

    def resolve(id:)
      StoreGood.where(store_id: id)
    end
  end

end