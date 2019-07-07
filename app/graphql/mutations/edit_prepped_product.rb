class Mutations::EditPreppedProduct < Mutations::BaseMutation
  argument :id, Integer, required: true
  argument :name, String, required: true
  argument :category, String, required: true
  argument :case_quantity, Integer, required: false
  argument :mark_up, Integer, required: true
  argument :marked_up_price, Float, required: false
  argument :portion_size, Integer, required: false

  field :product, Types::ProductType, null: false
  field :errors, [String], null: false

  def resolve(id:, name:, category:, case_quantity:, mark_up:, marked_up_price:, portion_size:)
    product = Product.find(id)
    category_id = Category.find_by(name: category).id

    if product.update(
      name: name,
      category_id: category_id,
      case_quantity: case_quantity,
      mark_up: mark_up, 
      marked_up_price: marked_up_price,
      portion_size: portion_size
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