class Mutations::EditStoreGood < Mutations::BaseMutation
  argument :id, Integer, required: true
  argument :location, String, required: true
  argument :distributor, String, required: true
  argument :max_amount, Integer, required: true
  argument :replenish_by_each, Boolean, required: true
  argument :count_by, String, required: true
  argument :delivery_day, String, required: true

  field :store_good, Types::StoreGoodType, null: false
  field :errors, [String], null: false

  def resolve(id:, location:, distributor:, max_amount:, replenish_by_each:, count_by:, delivery_day:)
    store_good = StoreGood.find(id)
    product_id = store_good.product.id
    distributor_id = Distributor.find_by(name: distributor).id
    location_id = Location.find_by(name: location).id
    count_by_id = CountBy.find_by(name: count_by).id

    if store_good.update(
        product_id: product_id,
        location_id: location_id, 
        distributor_id: distributor_id,
        max_amount: max_amount,
        replenish_by_each: replenish_by_each,
        count_by_id: count_by_id,
        delivery_day: delivery_day
      )
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