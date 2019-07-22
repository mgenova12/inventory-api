module Types
  class StoreGoodType < Types::BaseObject
    field :id, ID, null: true
    field :store, StoreType, null: true
    field :product, ProductType, null: true
    field :location, LocationType, null: true
    field :distributor, DistributorType, null: true
    field :max_amount, String, null: true
    field :replenish_by_each, Boolean, null: true
    field :delivery_day, String, null: true
  end
end