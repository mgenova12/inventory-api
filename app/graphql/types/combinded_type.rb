module Types
  class CombindedType < Types::BaseObject
    field :product, String, null: true
    field :on_hand, String, null:true
    field :total, String, null:true
    field :need, String, null:true
    field :stores, [String], null: true
  end
end