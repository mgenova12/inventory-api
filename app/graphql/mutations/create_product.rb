class Mutations::CreateProduct < Mutations::BaseMutation
  argument :name, String, required: true
  argument :distributor_id, Integer, required: true
  argument :count_by_id, Integer, required: true
  argument :category_id, Integer, required: true
  argument :case_quantity, Integer, required: false
  argument :price, Float, required: true
  argument :mark_up, Integer, required: true
  argument :prepped, Boolean, required: false

  field :product, Types::ProductType, null: false
  field :errors, [String], null: false

  def resolve(name:, distributor_id:, count_by_id:, category_id:, case_quantity:, price:, mark_up:, prepped:)
    product = Product.new(
      name: name,
      distributor_id: distributor_id, 
      count_by_id: count_by_id,
      category_id: category_id ,
      case_quantity: case_quantity,
      price: price, 
      mark_up: mark_up, 
      prepped: prepped
    )
    
    if product.save
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