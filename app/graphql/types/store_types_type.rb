module Types
  class StoreTypesType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :stores, [StoreType], null: true
  end
end