class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @bikes = Bike.all
    @bikes = @bikes.where(type: params[:type]) if params[:type].present?
    @bikes = @bikes.where(price: price_range(params[:price])) if params[:price].present?

    if params[:city].present?
      @users = User.all.near(params[:city])
    else
      @users = @bikes.map do |bike|
        bike.user
      end
    end

    @markers = @users.map do |user|
      if user.geocoded?
        {
          lat: user.latitude,
          lng: user.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: {user: user}),
          marker_html: render_to_string(partial: "marker")
        }
      end
    end
  end

  def new
    @bike = Bike.new
  end

  def show
    @bike = Bike.find(params[:id])
    @rental = Rental.new
    @user = @bike.user
    @markers = [{
        lat: @user.latitude,
        lng: @user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {user: @user}),
        marker_html: render_to_string(partial: "marker")
      }]
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

def price_range(price_param)
  case price_param
  when "0-20"
    0..20
  when "20-40"
    20..40
  when "40-60"
    40..60
  when "60+"
    60..Float::INFINITY
  else
    nil
  end
end
