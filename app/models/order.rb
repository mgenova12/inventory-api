class Order < ApplicationRecord
  has_many :inventories
  belongs_to :store
end
