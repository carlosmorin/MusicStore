class List < ApplicationRecord
  belongs_to :product, inverse_of: :lists
  belongs_to :cart, inverse_of: :lists

  def total
    product.price * quantity
  end
end
