module Types
  class DocumentDataType < Types::BaseObject
    field :id, ID, null: true
    field :product_id, Integer, null: true
    feild :document, String, null: true
  end
end