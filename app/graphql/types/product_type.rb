module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :distributor, DistributorType, null: true
    field :category, CategoryType, null: true
    field :count_by, CountByType, null: true
    field :case_quantity, Integer, null: true
    field :price, Float, null: true
  end
end