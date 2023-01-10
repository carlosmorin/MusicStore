class Product < ApplicationRecord
  belongs_to :user, inverse_of: :products
  
  has_one_attached :picture

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :picture, presence: true
  validates :status, presence: true

  enum status: %i[inactive active]
end
