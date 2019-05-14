class Mutations::EditDistributor < Mutations::BaseMutation
  argument :id, Integer, required: true
  argument :name, String, required: true

  field :distributor, Types::DistributorType, null: false
  field :errors, [String], null: false

  def resolve(id:, name:)
    distributor = Distributor.find(id)

    if distributor.update(name: name)
      # Successful creation, return the created object with no errors
      {
        distributor: distributor,
        errors: [],
      }
    else
      # Failed save, return the errors to the client
      {
        distributor: nil,
        errors: distributor.errors.full_messages
      }
    end
  end


end