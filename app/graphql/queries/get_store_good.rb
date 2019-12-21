module Queries
  class GetStoreGood < Queries::BaseQuery
    argument :id, Integer, required: true
    
    description 'Find One Store Goods'

    type Types::StoreGoodType, null: false

    def resolve(id:)
      StoreGood.find(id)
    end
  end

end