class Product < ApplicationRecord
  belongs_to :shop
  has_many :variants

  accepts_nested_attributes_for :variants, :allow_destroy => true, :reject_if => :all_blank
end
