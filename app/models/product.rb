class Product < ApplicationRecord
  belongs_to :shop
  has_many :varients

  accepts_nested_attributes_for :varients, :allow_destroy => true, :reject_if => :all_blank
end
