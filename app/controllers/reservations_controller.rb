class ReservationsController < ApplicationController
	def create
		@reservation = Reservation.new(reservation_params)
		if @reservation.save
			flash[:notice] = "Reservation created"
			ReservationMailer.reservation_notification(@reservation).deliver
			redirect_to @reservation.restaurant
		else
			flash[:error] = "Error creating reservation"
			redirect_to @reservation.restaurant
		end
	end

	def update
		@reservation = Reservation.find(params[:id])
		if @reservation.restaurant.user != current_user
			flash[:alert] = "Only the owner can edit a reservation"
			redirect_to @reservation.restaurant
		elsif @reservation.update_attributes(reservation_params)
			flash[:notice] = "Reservation succesfully modified"
			redirect_to @reservation.restaurant
		else
			flash[:error] = "Error updating restaurant"
			redirect_to edit_restaurant_path(@restaurant)
		end
	end

	private

	def reservation_params
		params.require(:reservation).permit(:email, :date_and_time, :restaurant_id, :message, :status)
	end

end
