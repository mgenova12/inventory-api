class Mutations::DeleteStoreGood < Mutations::BaseMutation
  argument :id, Integer, required: true

  field :errors, [String], null: false

  def resolve(id:)
    store_good = StoreGood.find(id)
    store_good.destroy
    
    {
      errors: []
    }

  end


end