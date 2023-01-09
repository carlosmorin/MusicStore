class User < ApplicationRecord
  validates :name, presence: true
  validates :last_name, presence: true

  has_many :products, inverse_of: :user, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    "#{name} #{last_name}"
  end
end
