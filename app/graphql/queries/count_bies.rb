module Queries
  class CountBies < Queries::BaseQuery
    
    description 'Find all Count by'

    type [Types::CountByType], null: false

    def resolve
      CountBy.all
    end

  end
end