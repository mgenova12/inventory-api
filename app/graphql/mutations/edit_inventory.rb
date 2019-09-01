class Mutations::EditInventory < Mutations::BaseMutation
  argument :id, Integer, required: true
  argument :quantity, Integer, required: true

  field :inventory, Types::InventoryType, null: false
  field :errors, [String], null: false

  def resolve(id:, quantity:)
    inventory = Inventory.find(id)

    if inventory.update(quantity: quantity)
      # Successful creation, return the created object with no errors
      {
        inventory: inventory,
        errors: [],
      }
    else
      # Failed save, return the errors to the client
      {
        inventory: nil,
        errors: inventory.errors.full_messages
      }
    end
  end


end