require 'rails_helper'

RSpec.describe Star, :type => :model do

	before { @star = FactoryGirl.create(:star) }

	subject { @star }

	it { should respond_to(:user) }
	it { should respond_to(:restaurant) }
	it { should respond_to(:created) }

	it { should be_valid } 

	describe 'when creating two stars for the same user and restaurant ' do
		before do
			@star2 = Star.new(restaurant_id: @star.restaurant_id, user_id: @star.user_id)
		end

		subject { @star2 }

		it { is_expected.to be_invalid }

	end

end
