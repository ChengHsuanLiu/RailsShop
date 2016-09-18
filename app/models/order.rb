class Order < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :line_items
end
