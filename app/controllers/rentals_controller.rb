class RentalsController < ApplicationController
  def accepted
    @rental = Rental.find(params[:id])
    @rental.status = "accepted"
    redirect_to dashboard_path, notice: "Rental updated successfully."
  end

  def declined
    @rental = Rental.find(params[:id])
    @rental.status = "declined"
    redirect_to dashboard_path, notice: "Rental updated successfully."
  end
end
