module Types
  class InventoryType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :store_id, Integer, null: true
    field :store_good, StoreGoodType, null: true
  end
end
