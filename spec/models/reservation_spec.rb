require 'rails_helper'

RSpec.describe Reservation, :type => :model do
	before (:each) do
		@date = DateTime.now + 1
		@restaurant = FactoryGirl.create(:restaurant)
		@reservation = Reservation.new(email: "aaa@bbb.ccc", date_and_time: @date, message: "Thanks", restaurant_id: @restaurant.id) 
	end

	subject { @reservation }

	it { is_expected.to respond_to(:email) }
	it { is_expected.to respond_to(:date_and_time ) }
	it { is_expected.to respond_to(:message) }
	it { is_expected.to respond_to(:restaurant) }

	describe "when email is not present" do
		before do 
			@reservation.email = ""
		end
		it { is_expected.to be_invalid }
	end

	describe "when date-time is not present" do
		before do 
			@reservation.date_and_time = nil
		end
		it { is_expected.to be_invalid}
	end

	describe "when not associated to a restaurant" do
		before do 
			@reservation.restaurant = nil
		end
		it { is_expected.to be_invalid}
	end

end