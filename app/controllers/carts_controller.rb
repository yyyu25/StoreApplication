class CartsController < ApplicationController

  # GET /cart
  def show
    @cart = current_cart
    @cartitems = @cart.cartitems

    tax_rate = 0.09125
    @delivery_fee = @cartitems.any? ? 9.99 : 0

    @subtotal_price = @cartitems.sum { |item| item.quantity * item.product.price }
    @estimated_sales_tax = (@subtotal_price * tax_rate).round(2)
    @total_price = @subtotal_price + @estimated_sales_tax + @delivery_fee
  end

  # DELETE /cart
  def destroy
    @cart = current_cart
    @cart.cartitems.destroy_all
    redirect_to shopper_index_path, notice: "Cart cleared."
  end

end