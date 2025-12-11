class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user, :logged_in?
  helper_method :current_cart
  

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def current_cart
    if current_user.nil?
      cart = Cart.find_by(id: session[:cart_id])
      unless cart
        cart = Cart.create(user_id: nil)
        session[:cart_id] = cart.id
      end
      return cart
    end
  
    current_user.cart || current_user.create_cart
  end

end
