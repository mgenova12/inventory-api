class Product < ApplicationRecord
  belongs_to :distributor
  belongs_to :category

  has_many :documents
  attr_accessor :document_data
end
