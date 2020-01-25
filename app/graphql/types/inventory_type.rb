module Types
  class InventoryType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :store_id, Integer, null: true
    field :quantity, Integer, null: true
    field :quantity_needed, Integer, null: true
    field :store_good, StoreGoodType, null: true
    field :store, StoreType, null: true
  end
end
