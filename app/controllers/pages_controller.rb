class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @bikes = Bike.all
  end

  def index
    @rentals = Rental.all(params) # to update -- Rental Controller
  end

  def dashboard
    @rentals = Rental.all
  end
end
