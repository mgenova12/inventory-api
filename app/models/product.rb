class Product < ApplicationRecord
  belongs_to :distributor
  belongs_to :measurement
  belongs_to :product_type
end
