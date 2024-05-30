class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @bikes = Bike.all
    @bikes = @bikes.where(type: params[:type]) if params[:type].present?
    @bikes = @bikes.where(price: price_range(params[:price])) if params[:price].present?
  end

  def owner_dashboard
    @rentals = Rental.select { |rental| rental.bike.user_id == current_user.id }
    @bikes = Bike.select { |bike| bike.user_id == current_user.id }
  end

  private

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
end
