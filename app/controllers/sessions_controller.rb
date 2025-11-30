class SessionsController < ApplicationController
  include CurrentCart
  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      login_merge_cart(user)
      redirect_to shopper_index_path, notice: "Welcome,#{user.first_name}!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to shopper_index_path, notice: "Logged out!"
  end

  private

  def login_merge_cart(user)
    anonymous_cart = Cart.find_by(id: session[:cart_id])

    if user.cart
      user_cart = user.cart

      if anonymous_cart
        anonymous_cart.cartitems.update_all(cart_id: user_cart.id)
        anonymous_cart.destroy
      end

      session[:cart_id] = user_cart.id
    else
      if anonymous_cart
        anonymous_cart.update(user: user)
        session[:cart_id] = anonymous_cart.id
      else
        new_cart = Cart.create(user: user)
        session[:cart_id] = new_cart.id
      end
    end
  end

end

