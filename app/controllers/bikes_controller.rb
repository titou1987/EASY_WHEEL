class BikesController < ApplicationController

  def index
    @bikes = Bike.all
  end

  def new
    @bike = Bike.new
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def create
    @bike = RestBikeaurant.new(bike_params)
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @bike = Bike.find(params[:id])
    @bike.update(bike_params)
    redirect_to bike_path(@bike)
  end

  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to bikes_path, status: :see_other
  end

  private

  def bike_params
    params.require(:bike, :price).permit(:bike_name, :type, :price)
  end

end