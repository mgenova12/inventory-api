module Types
  class InventoryPendingType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :store_id, Integer, null: true
    field :inventories, [InventoryType], null: true
  end
end
