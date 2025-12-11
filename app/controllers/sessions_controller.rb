class SessionsController < ApplicationController
  def new

  end

  def create
    puts "🔥 login attempt"
    current_cart
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      puts "🔥 LOGIN SUCCESS for user #{user.id}"
      session[:user_id] = user.id
      merge_cart(user)
      redirect_to shopper_index_path, notice: "Welcome,#{user.first_name}!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    session[:cart_id] = nil
    # reset_session
    redirect_to shopper_index_path, notice: "Logged out!"
  end

  private


  def merge_cart(user)
    puts "🔥 merge_cart running"
    puts "session[:cart_id]: #{session[:cart_id]}"
    session_cart = Cart.find_by(id: session[:cart_id])
    user_cart = user.cart || user.create_cart
  
    if session_cart && session_cart != user_cart
      session_cart.cartitems.each do |c|
        exist_item = user_cart.cartitems.find_by(product_id: c.product_id)
  
        if exist_item.nil?
          user_cart.cartitems.create(product_id: c.product_id, quantity: c.quantity)
          puts "🔥 cannot find, create one"
        else
          exist_item.update(quantity: exist_item.quantity + c.quantity)
        end
      end
  
      session_cart.destroy
    end
  
    session[:cart_id] = user_cart.id
  end

end

