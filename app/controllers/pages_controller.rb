class PagesController < ApplicationController
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
