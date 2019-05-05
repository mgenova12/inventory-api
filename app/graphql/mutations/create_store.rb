class Mutations::CreateStore < Mutations::BaseMutation
  argument :name, String, required: true
  argument :store_type_id, Integer, required: true

  field :store, Types::StoreType, null: false
  field :errors, [String], null: false

  def resolve(name:, store_type_id:)
    store = Store.new(name: name, store_type_id: store_type_id)
    
    if store.save
      # Successful creation, return the created object with no errors
      {
        store: store,
        errors: [],
      }
    else
      # Failed save, return the errors to the client
      {
        store: nil,
        errors: store.errors.full_messages
      }
    end
  end


end