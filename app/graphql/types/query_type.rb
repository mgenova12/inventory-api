module Types
  class QueryType < Types::BaseObject
    
    field :products, resolver: Queries::Products

  end
end
