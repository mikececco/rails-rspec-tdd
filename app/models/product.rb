class Product < ApplicationRecord
  validates :title, :description, :price, presence: true
  validates :title, :description, :price, uniqueness: true
end
