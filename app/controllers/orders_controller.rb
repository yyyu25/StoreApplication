class OrdersController < ApplicationController
  def new
    @cart = Cart.find(session[:cart_id])
    @order = Order.new 
  end

  def create
    @cart = Cart.find(session[:cart_id])
    @order = Order.new
    @order.user = current_user
    @order.total = @cart.total_price

    if @order.save
      # TODO: copy cartitems → order_items
      # TODO: clear cartitems
      redirect_to @order, notice: "Order placed!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order).permit()
  end
end
