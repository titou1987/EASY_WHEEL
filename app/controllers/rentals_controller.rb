class RentalsController < ApplicationController

  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @rental.bike
    if @rental.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

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

  private

  def rental_params
    params.require(:bike).permit(:start_date, :end_date)
  end
end
