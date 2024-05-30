class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @bikes = Bike.all
    @markers = User.all.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {user: user}),
        marker_html: render_to_string(partial: "marker")
      }
    end

  end

  def new
    @bike = Bike.new
  end

  def show
    @bike = Bike.find(params[:id])
    @rental = Rental.new

  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
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
    params.require(:bike).permit(:bike_name, :description, :type, :price, :photo)
  end
end
