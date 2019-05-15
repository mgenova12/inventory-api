class Mutations::DeleteProduct < Mutations::BaseMutation
  argument :id, Integer, required: true

  field :errors, [String], null: false

  def resolve(id:)
    product = Product.find(id)
    product.destroy
    
    {
      errors: []
    }

  end


end