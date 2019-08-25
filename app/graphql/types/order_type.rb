module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: true
    field :delivery_day, String, null: true
    field :inventories, [InventoryType], null: true
  end
end
