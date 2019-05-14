module Queries
  class Products < Queries::BaseQuery
    
    description 'Find all Products'

    type [Types::ProductType], null: false

    def resolve
      Product.order("created_at DESC")
    end

  end
end