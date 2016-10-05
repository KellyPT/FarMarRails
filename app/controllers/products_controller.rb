class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(prod_params)
    if @product.save
      # SAVED SUCCESSFULLY
    else
      # DID NOT SAVE
      render :new
    end

    # redirect_to vendors_path
  end

  private

  def prod_params
    params.require(:product).permit(:ref_id, :name, :vendor_id)
  end

end
