class Product < ApplicationRecord
  belongs_to :user, inverse_of: :products

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
