class Product < ApplicationRecord
  belongs_to :distributor, optional: true
  belongs_to :category
  has_many :documents
  attr_accessor :document_data
end
