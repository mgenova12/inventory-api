module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :distributor, DistributorType, null: true
    field :category, CategoryType, null: true
    field :case_quantity, Integer, null: true
    field :price, Float, null: true
    field :mark_up, Integer, null: true
    field :prepped, Boolean, null: true
    field :barcode, Integer, null: true
    field :description, String, null: true
    field :distributor_number, Integer, null: true
    field :brand, String, null: true
    field :unit_size, String, null: true
    field :documents, [DocumentDataType], null: true
  end
end