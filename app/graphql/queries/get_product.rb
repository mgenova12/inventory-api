module Queries
  class GetProduct < Queries::BaseQuery
    argument :id, Integer, required: true
    
    description 'Find a Product'

    type Types::ProductType, null: false

    def resolve(id:)
      Product.find(id)
    end
  end

end