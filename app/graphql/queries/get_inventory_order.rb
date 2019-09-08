module Queries
  class GetInventoryOrder < Queries::BaseQuery
    argument :store_id, Integer, required: true
    argument :order_id, Integer, required: true
    
    description 'Find a Inventory Order'

    type [Types::InventoryType], null: false

    def resolve(store_id:, order_id:)
      store_name = Store.find(store_id).name
      Inventory.where(order_id: order_id).where.not(quantity_needed: 0).joins({:store_good => :distributor }).where("distributors.name = '#{store_name}'")
    end
  end

end

