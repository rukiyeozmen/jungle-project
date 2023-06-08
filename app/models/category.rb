class Product < ApplicationRecord
  has_many :products
  belongs_to :category

  validates :name, :price, :quantity, :category, presence: true
end
