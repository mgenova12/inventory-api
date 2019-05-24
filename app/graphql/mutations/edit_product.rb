class Mutations::EditProduct < Mutations::BaseMutation
  argument :id, Integer, required: true
  argument :name, String, required: true
  argument :distributor, String, required: true
  argument :category, String, required: true
  argument :case_quantity, Integer, required: false
  argument :price, Float, required: true
  argument :mark_up, Integer, required: true
  argument :prepped, Boolean, required: false

  field :product, Types::ProductType, null: false
  field :errors, [String], null: false

  def resolve(id:, name:, distributor:, category:, case_quantity:, price:, mark_up:, prepped:)
    product = Product.find(id)
    distributor_id = Distributor.find_by(name: distributor).id
    category_id = Category.find_by(name: category).id

    if product.update(
      name: name,
      distributor_id: distributor_id, 
      category_id: category_id ,
      case_quantity: case_quantity,
      price: price, 
      mark_up: mark_up, 
      prepped: prepped
    )
      # Successful creation, return the created object with no errors
      {
        product: product,
        errors: [],
      }
    else
      # Failed save, return the errors to the client
      {
        product: nil,
        errors: product.errors.full_messages
      }
    end
  end


end