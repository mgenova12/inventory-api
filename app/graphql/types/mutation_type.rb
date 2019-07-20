module Types
  class MutationType < Types::BaseObject
    field :create_store, mutation: Mutations::CreateStore
    field :create_distributor, mutation: Mutations::CreateDistributor
    field :create_product, mutation: Mutations::CreateProduct
    field :delete_distributor, mutation: Mutations::DeleteDistributor
    field :edit_distributor, mutation: Mutations::EditDistributor    
    field :delete_product, mutation: Mutations::DeleteProduct
    field :edit_product, mutation: Mutations::EditProduct
    field :edit_prepped_product, mutation: Mutations::EditPreppedProduct
    field :update_location_row_order, mutation: Mutations::UpdateLocationRowOrder
    field :create_location, mutation: Mutations::CreateLocation
    field :delete_location, mutation: Mutations::DeleteLocation
  end
end
