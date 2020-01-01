module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: true
    field :store_id, ID, null: true
    field :created_at, String, null: true
    field :store, StoreType, null: true
    field :delivery_day, String, null: true
    field :status, String, null: true
    field :inventories, [InventoryType], null: true
  end
end
