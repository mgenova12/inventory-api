module Types
  class QueryType < Types::BaseObject
    field :products, resolver: Queries::Products
    field :stores, resolver: Queries::Stores
    field :store_types, resolver: Queries::StoreTypes
    field :distributors, resolver: Queries::Distributors
    field :categories, resolver: Queries::Categories
    field :count_bies, resolver: Queries::CountBies
  end
end
