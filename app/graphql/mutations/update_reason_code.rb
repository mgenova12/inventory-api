class Mutations::UpdateReasonCode < Mutations::BaseMutation
  argument :id, Integer, required: true
  argument :reason_code, String, required: true

  field :inventory, Types::InventoryType, null: false
  field :errors, [String], null: false

  def resolve(id:, reason_code:)
    inventory = Inventory.find(id)
    inventory.update(reason_code: reason_code)

    {
      inventory: inventory,
      errors: []
    }

  end


end