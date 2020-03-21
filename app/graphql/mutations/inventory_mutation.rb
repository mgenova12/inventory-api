# module InventoryMutations

#   Update = GraphQL::Relay::Mutation.define do
#     name "updateInventory"
#     description "update Appointment"

#     input_field :reason_code, types.String

#     return_field :inventory, InventoryType
    
#     resolve -> (obj, inputs, ctx) {
#       if inputs[:reason_code] 
#         Inventory.find(ctx[:id]).update(reason_code: inputs[:reason_code])
#       end
#     }

#   end


# end