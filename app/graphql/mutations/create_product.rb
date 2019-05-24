class Mutations::CreateProduct < Mutations::BaseMutation
  argument :name, String, required: true
  argument :distributor_id, Integer, required: true
  argument :category_id, Integer, required: true
  argument :case_quantity, Integer, required: false
  argument :price, Float, required: true
  argument :mark_up, Integer, required: true
  argument :prepped, Boolean, required: false
  
  argument :barcode, Integer, required: false
  argument :description, String, required: false
  argument :distributor_number, Integer, required: false
  argument :brand, String, required: false
  argument :unit_size, String, required: false

  field :product, Types::ProductType, null: false
  field :errors, [String], null: false

  def resolve(name:, distributor_id:, category_id:, case_quantity:, price:, mark_up:, prepped:, barcode:, description:, distributor_number:, brand:, unit_size:)
    product = Product.new(
      name: name,
      distributor_id: distributor_id, 
      category_id: category_id ,
      case_quantity: case_quantity,
      price: price, 
      mark_up: mark_up, 
      prepped: prepped,
      barcode: barcode, 
      description: description,
      distributor_number: distributor_number,
      brand: brand, 
      unit_size: unit_size
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