class ReservationMailer < ActionMailer::Base
  default from: "fancyrestaurants@test.com"

  def reservation_notification(reservation)
  	@reservation = reservation
  	mail(to: @reservation.restaurant.user.email, subject: "New reservation")
  end
end
