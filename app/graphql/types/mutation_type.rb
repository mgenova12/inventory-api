module Types
  class MutationType < Types::BaseObject
    field :create_store, mutation: Mutations::CreateStore
    field :create_distributor, mutation: Mutations::CreateDistributor
    field :create_product, mutation: Mutations::CreateProduct
    field :create_location, mutation: Mutations::CreateLocation
    field :create_store_good, mutation: Mutations::CreateStoreGood
    field :create_inventory, mutation: Mutations::CreateInventory
    
    field :delete_distributor, mutation: Mutations::DeleteDistributor
    field :delete_product, mutation: Mutations::DeleteProduct
    field :delete_location, mutation: Mutations::DeleteLocation
    field :delete_store_good, mutation: Mutations::DeleteStoreGood
    field :delete_inventory, mutation: Mutations::DeleteInventory
    
    field :edit_distributor, mutation: Mutations::EditDistributor    
    field :edit_product, mutation: Mutations::EditProduct
    field :edit_prepped_product, mutation: Mutations::EditPreppedProduct
    field :edit_store_good, mutation: Mutations::EditStoreGood
    field :edit_inventory, mutation: Mutations::EditInventory
    field :edit_inventory_quantity_needed, mutation: Mutations::EditInventoryQuantityNeeded

    field :update_location_row_order, mutation: Mutations::UpdateLocationRowOrder
    field :update_amount_in_stock, mutation: Mutations::UpdateAmountInStock
    field :update_scanned, mutation: Mutations::UpdateScanned
    field :update_reason_code, mutation: Mutations::UpdateReasonCode
    field :update_final_inventory_order, mutation: Mutations::UpdateFinalInventoryOrder

    field :sign_in_user, mutation: Mutations::SignInUser
    
  end
end
