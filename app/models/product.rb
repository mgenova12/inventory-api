class Product < ApplicationRecord
  belongs_to :distributor
  belongs_to :category
end
