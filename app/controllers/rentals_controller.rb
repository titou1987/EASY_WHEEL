class RentalsController < ApplicationController

  def create

    @rental = Rental.new(rental_params)
    @bike = Bike.find(params[:bike_id])
    @rental.bike = @bike
    @rental.user = current_user

    if @rental.save!
      redirect_to dashboards_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accepted
    @rental = Rental.find(params[:id])
    @rental.status = "accepted"
    redirect_to dashboards_path, notice: "Rental updated successfully."
  end

  def declined
    @rental = Rental.find(params[:id])
    @rental.status = "declined"
    redirect_to dashboards_path, notice: "Rental updated successfully."
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :bike_id, :user_id)
  end
end