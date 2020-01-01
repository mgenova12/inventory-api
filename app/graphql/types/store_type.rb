module Types
  class StoreType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :store_type_id, Integer, null: true
    field :store_type, StoreTypesType, null: true
    field :inventories, [InventoryType], null: true
  end
end