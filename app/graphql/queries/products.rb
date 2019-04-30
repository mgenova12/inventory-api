module Queries
  class Products < Queries::BaseQuery
    
    description 'Find all Products'

    type [Types::ProductType], null: false

    def resolve
      Product.all
    end

  end
end