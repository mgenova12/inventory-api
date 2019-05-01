class Product < ApplicationRecord
  belongs_to :distributor
  belongs_to :count_by
  belongs_to :category
end
