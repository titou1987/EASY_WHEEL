class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @bikes = Bike.all
  end

  def dashboard
    @rentals = Rental.select { |rental| rental.bike.user_id == current_user.id }
    @bikes = Bike.select { |bike| bike.user_id == current_user.id }
  end
end
