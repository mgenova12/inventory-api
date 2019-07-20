class Mutations::DeleteLocation < Mutations::BaseMutation
  argument :id, Integer, required: true

  field :errors, [String], null: false

  def resolve(id:)
    location = Location.find(id)
    location.destroy
    
    {
      errors: []
    }

  end


end