class PurchasesController < ApplicationController
  def index
    @purchases = current_user.carts.closed
  end

  def show
    @purchase = Cart.find(params[:id])
  end
end
