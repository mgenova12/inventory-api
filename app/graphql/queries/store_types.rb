module Queries
  class StoreTypes < Queries::BaseQuery
    
    description 'Find all Stores'

    type [Types::StoreTypesType], null: false

    def resolve
      StoreType.all
    end

  end
end