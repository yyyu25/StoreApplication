class CartitemsController < ApplicationController
  include CurrentCart
  before_action :set_cartitem, only: %i[ show edit update destroy ]
  before_action :set_cart  

  # GET /cartitems or /cartitems.json
  def index
    @cartitems = Cartitem.all
  end

  # GET /cartitems/1 or /cartitems/1.json
  def show
  end

  # GET /cartitems/new
  def new
    @cartitem = Cartitem.new
  end

  # GET /cartitems/1/edit
  def edit
  end

  # POST /cartitems or /cartitems.json
  def create
    exist_item = @cart.cartitems.find_by(product_id: params[:product_id])

    if exist_item
      exist_item.quantity += 1
      if exist_item.save
        redirect_to shopper_index_path(added: params[:product_id])
      else
        redirect_to shopper_index_path, alert: "Failed to add item."
      end
    else
      @cartitem = @cart.cartitems.build(product_id: params[:product_id])    
    
      if @cartitem.save
        redirect_to shopper_index_path(added: params[:product_id])
      else
        redirect_to shopper_index_path, alert: "Failed to add item."
      end
    end
    
  end

  # PATCH/PUT /cartitems/1 or /cartitems/1.json
  def update
      @cartitem = Cartitem.find(params[:id])
    
      if @cartitem.update(cartitem_params)
        redirect_to cart_path(session[:cart_id]), notice: "Updated!"
      else
        redirect_to cart_path(session[:cart_id]), alert: "Update failed."
      end
  end

  # DELETE /cartitems/1 or /cartitems/1.json
  def destroy
    @cartitem.destroy!

    respond_to do |format|
      format.html { redirect_to cart_path(session[:cart_id]), notice: "Item removed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cartitem
      @cartitem = Cartitem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cartitem_params
      params.require(:cartitem).permit(:quantity)
    end

end