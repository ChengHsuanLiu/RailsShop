class LineItem < ApplicationRecord
  belongs_to :varient
  belongs_to :order
end
