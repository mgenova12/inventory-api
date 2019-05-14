module Types
  class MutationType < Types::BaseObject
    field :create_store, mutation: Mutations::CreateStore
    field :create_distributor, mutation: Mutations::CreateDistributor
    field :create_product, mutation: Mutations::CreateProduct
    field :delete_distributor, mutation: Mutations::DeleteDistributor
  end
end
