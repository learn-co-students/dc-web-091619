class RetailersController < ApplicationController
  def index
    @retailers = Retailer.all
  end

  def show
    @retailer = Retailer.find(params[:id])
  end

  def new
    @retailer = Retailer.new
    @retailer.snacks.build
  end

  def create
    @retailer = Retailer.new(retailer_params)
    if @retailer.valid?
      @retailer.save
      redirect_to retailer_path(@retailer)
    else
      @retailer.snacks.build
      render :new
    end
  end

  def edit
    @retailer = Retailer.find(params[:id])
  end

  def update
    @retailer = Retailer.find(params[:id])
    @retailer.update(retailer_params)
    redirect_to retailer_path(@retailer)
  end

  private

  def retailer_params
    params.require(:retailer).permit(:name, :year_established,
        snacks_attributes: [:name, :calories, :deliciousness])
  end

end
