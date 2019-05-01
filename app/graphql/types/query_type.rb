module Types
  class QueryType < Types::BaseObject
    
    field :products, resolver: Queries::Products

    # field :products, query: Queries::Products
  end
end
