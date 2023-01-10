class Product < ApplicationRecord
  belongs_to :user, inverse_of: :products
  has_many :lists, inverse_of: :products, dependent: :destroy
  
  has_one_attached :picture
  has_rich_text :description

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :picture, presence: true
  validates :status, presence: true
  validates :description, presence: true

  enum status: %i[inactive active]
end
