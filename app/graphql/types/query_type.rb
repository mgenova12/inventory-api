module Types
  class QueryType < Types::BaseObject
    field :products, resolver: Queries::Products
    field :prepped_products, resolver: Queries::PreppedProducts
    field :get_product, resolver: Queries::GetProduct
    field :stores, resolver: Queries::Stores
    field :store_types, resolver: Queries::StoreTypes
    field :distributors, resolver: Queries::Distributors
    field :categories, resolver: Queries::Categories
    field :count_bies, resolver: Queries::CountBies
    field :document_data, resolver: Queries::DocumentData
    field :locations, resolver: Queries::Locations
    field :get_store, resolver: Queries::GetStore
  end
end
