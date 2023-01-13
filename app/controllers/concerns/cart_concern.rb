module CartConcern
  extend ActiveSupport::Concern  

  included do
    before_action :initialize_cart
  end

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    return if @cart

    @cart = Cart.create(user: current_user)
    session[:cart_id] = @cart.id
  end
end