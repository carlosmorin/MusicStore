class Cart < ApplicationRecord
  belongs_to :user, inverse_of: :carts
  has_many :lists, inverse_of: :cart, dependent: :destroy
  enum status: %i[open closed]

  def empty?
    lists.size.eql? 0
  end

  def items_size
    lists.to_a.sum { |list| list.quantity }
  end

  def total
    lists.to_a.sum { |list| list.total }
  end
end
