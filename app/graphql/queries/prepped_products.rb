module Queries
  class PreppedProducts < Queries::BaseQuery
    description 'Find all Prepped Products'

    type [Types::PreppedProductType], null: false

    def resolve
      Product.where(prepped: true).order("created_at DESC")
    end
  end

end