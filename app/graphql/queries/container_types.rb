module Queries
  class ContainerTypes < Queries::BaseQuery
    
    description 'Find all ContainerTypes'

    type [Types::ContainerTypeType], null: false

    def resolve
      ContainerType.all
    end

  end
end