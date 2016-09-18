class Shop < ApplicationRecord
  has_many :products
  has_many :orders
  has_many :admins
end
