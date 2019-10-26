class Mutations::UpdateAmountInStock < Mutations::BaseMutation
  argument :id, Integer, required: true
  argument :amount_in_stock, Integer, required: true

  field :store_good, Types::StoreGoodType, null: false
  field :errors, [String], null: false

  def resolve(id:, amount_in_stock:)
    store_good = StoreGood.find(id)
    store_good_amount_in_stock = store_good.amount_in_stock + amount_in_stock

    if store_good.update(amount_in_stock: store_good_amount_in_stock)
      # Successful creation, return the created object with no errors
      {
        store_good: store_good,
        errors: [],
      }
    else
      # Failed save, return the errors to the client
      {
        store_good: nil,
        errors: store_good.errors.full_messages
      }
    end
  end


end