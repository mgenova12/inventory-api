module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :case_quantity, Integer, null: true
    field :price, Float, null: true
    field :amount_in_stock, Integer, null: true
    field :distributor, DistributorType, null: true
    field :measurement, MeasurementType, null: true
    field :product_type, ProductTypeType, null: true
  end
end