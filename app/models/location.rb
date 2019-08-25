class Location < ApplicationRecord
  # default_scope { order('row_order ASC') }
  belongs_to :store
  has_many :store_goods
  has_many :inventories, -> { where status: 'pending' }
end
