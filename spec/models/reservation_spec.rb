require 'rails_helper'

RSpec.describe Reservation, :type => :model do
	before { @reservation = Reservation.new() }

	subject { @reservation }

	it { is_expected.to respond_to(:email) }
	it { is_expected.to respond_to(:date_and_time ) }
	it { is_expected.to respond_to(:message) }
	it { is_expected.to respond_to(:restaurant) }

end