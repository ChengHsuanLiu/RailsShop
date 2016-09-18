class Product < ApplicationRecord
  belongs_to :shop
  has_many :varients
end
