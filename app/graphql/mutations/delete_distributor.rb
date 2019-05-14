class Mutations::DeleteDistributor < Mutations::BaseMutation
  argument :id, Integer, required: true

  field :errors, [String], null: false

  def resolve(id:)
    distributor = Distributor.find(id)
    distributor.destroy
    
    {
      errors: []
    }

  end


end