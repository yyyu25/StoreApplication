class ShopperController < ApplicationController
  def index
    if params[:query].present?
      @products = Product.where("name LIKE ? OR description LIKE ?", 
                                "%#{params[:query]}%", 
                                "%#{params[:query]}%").order(:name)
    else
      @products = Product.order(:name)
    end
  end
  
  def show
    @product = Product.find(params[:id])
  end
end
