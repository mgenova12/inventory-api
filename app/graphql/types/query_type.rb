module Types
  class QueryType < Types::BaseObject
    field :products, resolver: Queries::Products
    field :stores, resolver: Queries::Stores
    field :store_types, resolver: Queries::StoreTypes
  end
end
