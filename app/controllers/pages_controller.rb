class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @bikes = Bike.all
  end

  def index
    @rentals = Rental.all(params) # to update -- Rental Controller
  end

  def show
    ## TODO code dashboard controler!
  end
end
