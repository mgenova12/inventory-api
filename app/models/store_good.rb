class StoreGood < ApplicationRecord
  belongs_to :store
  belongs_to :product
  belongs_to :location
  belongs_to :distributor
end
