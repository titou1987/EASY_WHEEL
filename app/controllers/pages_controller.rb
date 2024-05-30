class PagesController < ApplicationController
skip_before_action :authenticate_user!, only: :home
# before_action :authenticate_user!, unless: :home
  def home
  end

  def owner_dashboard
    @rentals = Rental.select { |rental| rental.bike.user_id == current_user.id }
    @bikes = Bike.select { |bike| bike.user_id == current_user.id }
  end
end 
