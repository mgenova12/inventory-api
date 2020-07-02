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
    field :get_store_goods, resolver: Queries::GetStoreGoods
    field :get_removed_store_goods, resolver: Queries::GetRemovedStoreGoods
    field :get_inventory, resolver: Queries::GetInventory
    field :get_store_inventory, resolver: Queries::GetStoreInventory
    field :orders, resolver: Queries::Orders
    field :get_inventory_order, resolver: Queries::GetInventoryOrder
    field :store_orders, resolver: Queries::StoreOrders
    field :container_types, resolver: Queries::ContainerTypes
    field :get_store_good, resolver: Queries::GetStoreGood
    field :get_combinded, resolver: Queries::GetCombinded
  end
end
