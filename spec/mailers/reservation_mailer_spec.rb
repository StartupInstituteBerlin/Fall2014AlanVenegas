require "rails_helper"

RSpec.describe ReservationMailer, :type => :mailer do
	describe "email for table reservation" do
		let(:reservation) { FactoryGirl.create(:reservation) }
		let(:mail) { ReservationMailer.reservation_notification(reservation) }
		it "renders the subject" do
			expect(mail.subject).to eql("New reservation")
		end
		it 'renders the receiver email' do
			expect(mail.to).to include(reservation.restaurant.user.email)
		end

		it 'renders the sender email' do
			expect(mail.from).to eql(['fancyrestaurants@test.com'])
		end

	end
end
