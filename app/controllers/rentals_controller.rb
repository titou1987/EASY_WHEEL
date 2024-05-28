class RentalsController < ApplicationController
  def update
    @rental = Rental.find(params[:id])
    @rental.update(rental_params)
    redirect_to dashboard_path, notice: "Rental updated successfully."
  end
end
