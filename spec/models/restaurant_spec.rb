require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

	before {
		@user = FactoryGirl.create(:user)
		@restaurant = FactoryGirl.create(:restaurant)
	}

	subject { @restaurant }
	it { is_expected.to respond_to(:name) }
	it { is_expected.to respond_to(:description) }
	it { is_expected.to respond_to(:address) }
	it { is_expected.to respond_to(:phone) }
	it { is_expected.to respond_to(:user) }
	it { is_expected.to respond_to(:stars) }
	it { is_expected.to respond_to(:starred_by) }

	it { is_expected.to be_valid }

	describe 'when name is blank' do
		before { @restaurant.name="" }
		it { is_expected.to be_invalid }
	end

	describe 'when user_id is not present' do
		before { @restaurant.user_id=nil }
		it { is_expected.to be_invalid }
	end
end
