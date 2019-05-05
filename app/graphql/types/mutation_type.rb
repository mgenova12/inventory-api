module Types
  class MutationType < Types::BaseObject
    field :create_store, mutation: Mutations::CreateStore
  end
end
