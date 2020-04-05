module Types
  class PreppedProductType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :category, CategoryType, null: true
    field :case_quantity, Integer, null: true
    field :mark_up, Integer, null: true
    field :prepped, Boolean, null: true
    field :barcode, Integer, null: true
    field :description, String, null: true
    field :documents, [DocumentDataType], null: true
    field :portion_size, Integer, null: true
    field :marked_up_price, Float, null: true
    field :p_id, Integer, null: true
  end
end