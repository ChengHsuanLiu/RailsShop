class Varient < ApplicationRecord
  has_many :cart_items
  has_many :line_items
  belongs_to :product
end
