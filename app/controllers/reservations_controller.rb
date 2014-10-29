class ReservationsController < ApplicationController
	def create
		@reservation = Reservation.new(reservation_params)
		if @reservation.save
			flash[:notice] = "Reservation created"
			redirect_to root_path
		else
			flash[:error] = "Error creating reservation"
			redirect_to root_path
		end

	end
	private

 def reservation_params
    params.require(:reservation).permit(:email, :date_and_time, :restaurant_id, :message)
  end

end