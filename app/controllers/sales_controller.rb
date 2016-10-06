class SalesController < ApplicationController

  def index
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @sale = @vendor.sales.build
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @sale = @vendor.sales.new(sale_params)
    if @sale.save
      # SAVED SUCCESSFULLY
      redirect_to vendor_products_path
    else
      # DID NOT SAVE
      puts @sale.errors.messages
      render :new
    end
  end

  # def edit
  #   @vendor = Vendor.find(params[:vendor_id])
  #   @product = Product.find(params[:id])
  # end
  #
  # def update
  #   @vendor = Vendor.find(params[:vendor_id])
  #   @product = Product.find(params[:id])
  #   if @product.update(prod_params)
  #     # SUCCESS
  #     redirect_to vendor_products_path
  #   else
  #     # NOPE
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   Product.find(params[:id]).destroy
  #   redirect_to vendor_products_path
  # end

  private

  def sale_params
    params.require(:product).permit(:ref_id, :product_id, :vendor_id, :amount, :purchase_time)
  end

end
