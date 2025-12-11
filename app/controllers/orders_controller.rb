class OrdersController < ApplicationController
  before_action :require_login

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    @cart = current_cart
    if @cart.cartitems.empty?
      redirect_to shopper_index_path, alert: "Your cart is empty." and return
    end
    @order = Order.new 
  end

  def create
    @cart = current_cart
    @user = current_user

    if @cart.cartitems.empty?
      redirect_to shopper_index_path, alert: "Your cart is empty." and return
    end

    if @user.address.blank? || @user.card_last4digits.blank? || @user.pay_type.blank? || @user.phone.blank?
      redirect_to user_path(@user), alert: "Please complete your profile before checkout." and return
    end

    @order = Order.new(user: current_user, total: @cart.total)

    begin
      ActiveRecord::Base.transaction do
        @cart.cartitems.each do |ci|
          if ci.quantity > ci.product.quantity || !ci.product.available
            raise StandardError, "Check out failed. Not available for #{ci.product.name}"
          end
        end
    
        # 保存订单
        unless @order.save
          raise StandardError, "Check out failed."
        end

        @cart.cartitems.each do |ci|
          @order.order_items.create!(
            product: ci.product,
            quantity: ci.quantity,
            price: ci.product.price
          )
          ci.product.decrement!(:quantity, ci.quantity)
        end

        @cart.cartitems.destroy_all
      end

      redirect_to @order, notice: "Order placed successfully!"
    rescue => e
      redirect_to cart_path, alert: e.message
    end
  end

  private
  def order_params
    params.require(:order).permit()
  end

  def require_login
    unless current_user
      redirect_to login_path, alert: "Please log in first."
    end
  end

  def cart_is_empty
    @cart = current_cart
    if @cart.cartitems.empty?
      redirect_to shopper_index_path, alert: "Your cart is empty."
    end
  end
end
