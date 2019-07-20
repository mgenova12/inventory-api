class Store < ApplicationRecord
  belongs_to :store_type
  has_many :locations
end
