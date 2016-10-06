class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.build
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.new(prod_params)
    if @product.save
      # SAVED SUCCESSFULLY
      redirect_to vendor_products_path
    else
      # DID NOT SAVE
      puts @product.errors.messages
      render :new
    end

  end

  private

  def prod_params
    params.require(:product).permit(:ref_id, :name, :vendor_id)
  end

end
