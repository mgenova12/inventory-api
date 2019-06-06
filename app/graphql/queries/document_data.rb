module Queries
  class DocumentData < Queries::BaseQuery
    
    description 'Find all Document Data'

    type [Types::DocumentDataType], null: false

    def resolve
      Document.all
    end

  end
end