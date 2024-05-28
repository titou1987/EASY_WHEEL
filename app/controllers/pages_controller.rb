class PagesController < ApplicationController
  def home
    @bikes = Bike.all
  end

  def show
    ## TODO code dashboard controler!
  end
end
