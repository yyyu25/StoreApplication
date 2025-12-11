class CartitemsController < ApplicationController
  before_action :set_cart
  before_action :set_cartitem, only: %i[ show edit update destroy ]

  # GET /cartitems
  def index
    @cartitems = Cartitem.all
  end

  def show
  end

  def new
    @cartitem = Cartitem.new
  end

  def edit
  end

  def create
    product = Product.find_by(id: params[:product_id])
    unless product
      return redirect_to shopper_index_path, alert: "Product not found."
    end
  
    if product.quantity <= 0 || !product.available
      return redirect_to shopper_index_path, alert: "Sorry, this item is not available now."
    end
  
    exist_item = @cart.cartitems.find_by(product_id: product.id)
  
    if exist_item
      if exist_item.quantity >= product.quantity
        return redirect_to shopper_index_path, alert: "Add to cart failed: stock limit reached."
      end
      exist_item.quantity += 1
      if exist_item.save
        redirect_to shopper_index_path(added: product.id)
      else
        redirect_to shopper_index_path, alert: "Failed to add item."
      end
    else
      @cartitem = @cart.cartitems.build(product_id: product.id, quantity: 1)
  
      if @cartitem.save
        redirect_to shopper_index_path(added: product.id)
      else
        redirect_to shopper_index_path, alert: "Failed to add item."
      end
    end
  end


  def update
    product = @cartitem.product
    new_qty = params[:cartitem][:quantity].to_i
    
    if new_qty > product.quantity
      respond_to do |format|
        format.js { flash.now[:alert] = "Not enough stock. Maximum availble is #{product.quantity}." }
        format.html { redirect_to cart_path, alert: "Not enough stock. Maximum availble is #{product.quantity}." }
      end
      return
    end

    if @cartitem.update(cartitem_params)
      respond_to do |format|
        format.js
        format.html { redirect_to cart_path }
      end
    else
      respond_to do |format|
        format.js
        format.html { render :edit }
      end
    end
  end

  def destroy
    @cartitem.destroy!
    redirect_to cart_path(session[:cart_id]), notice: "Item removed."
  end

  private

  def set_cart
    @cart = current_cart
  end

  def set_cartitem
    @cartitem = Cartitem.find(params[:id])
  end

  def cartitem_params
    params.require(:cartitem).permit(:quantity)
  end
end