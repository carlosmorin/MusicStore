class CartController < ApplicationController
  before_action :set_product, only: %i[add]
  include CartConcern

  def index
  end

  def add
    @list = List.new(list_params)


    if current_list && @list.quantity > 0
      update
    elsif @list.quantity <= 0
      destroy
    else
      @list.cart = @cart
      @list.save!
    end

    render_partials
  end

  def update
    current_list.update(list_params)
  end

  def finish
    @cart.status = :closed
    @cart.save!
    close_cart

    render_partials
  end

  def destroy
    current_list.destroy
  end

  private
    def render_partials
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace('cart', partial: 'cart/cart', locals: { cart: @cart}),
            turbo_stream.replace('cart_icon', partial: 'cart/cart_icon', locals: { cart: @cart  })
          ]
        end
      end
    end

    def current_list
      @cart.lists.find_by(product_id: @product.id)
    end

    def set_product
      @product = Product.find_by(id: list_params[:product_id])
    end

    def list_params
      params.require(:list).permit(:product_id, :cart_id, :quantity)
    end
end
