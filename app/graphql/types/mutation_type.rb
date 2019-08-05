module Types
  class MutationType < Types::BaseObject
    field :create_store, mutation: Mutations::CreateStore
    field :create_distributor, mutation: Mutations::CreateDistributor
    field :create_product, mutation: Mutations::CreateProduct
    field :create_location, mutation: Mutations::CreateLocation
    field :create_store_good, mutation: Mutations::CreateStoreGood
    
    field :delete_distributor, mutation: Mutations::DeleteDistributor
    field :delete_product, mutation: Mutations::DeleteProduct
    field :delete_location, mutation: Mutations::DeleteLocation
    field :delete_store_good, mutation: Mutations::DeleteStoreGood
    
    field :edit_distributor, mutation: Mutations::EditDistributor    
    field :edit_product, mutation: Mutations::EditProduct
    field :edit_prepped_product, mutation: Mutations::EditPreppedProduct
    field :edit_store_good, mutation: Mutations::EditStoreGood

    field :update_location_row_order, mutation: Mutations::UpdateLocationRowOrder
    
  end
end
