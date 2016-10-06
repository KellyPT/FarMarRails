class MarketsController < ApplicationController
  def overview
  end

  def view_markets # show all markets
    @markets = Market.all
  end

  def view_market # show a market
    @market = Market.find(params[:id])
    @vendors = @market.vendors
  end

  def view_vendors
    @market = Market.find(params[:id])
    @vendors = @market.vendors
  end

  def index
    @markets = Market.all
  end

  def show
    @market = Market.find(params[:id])
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(market_params)
    if @market.save
      redirect_to markets_path
    else
      render :new
    end
  end

  def edit #
    @market = Market.find(params[:id])
  end

  def update #
    @market = Market.find(params[:id])
      if @market.update(market_params)
        redirect_to markets_path
      else
        render :edit
      end
  end

  private

  def market_params
    params.require(:market).permit(:ref_id, :name, :address, :city, :county, :state, :zip)
  end
end
