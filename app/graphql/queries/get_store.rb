module Queries
  class GetStore < Queries::BaseQuery
    argument :id, Integer, required: true
    
    description 'Find a Store'

    type Types::StoreType, null: false

    def resolve(id:)
      Store.find(id)
    end
  end

end