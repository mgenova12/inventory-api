class StoreGood < ApplicationRecord
  belongs_to :store
  belongs_to :product
  belongs_to :location
  belongs_to :distributor
  belongs_to :count_by
  belongs_to :container_type, optional: true
  has_many :inventories
end
