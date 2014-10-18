require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

	before {
		@user = User.create(name: "Some user", email: "some@email.com", password: "holahola", password_confirmation: "holahola")
		@restaurant = @user.restaurants.build(name: "Some restaurant", description: "Some characteristics",
																					address: "Somewhere", phone: "555-555-555" )
	}

	#	Restaurant.new(name: "Some restaurant", description: "Some characteristics",
	#																			address: "Somewhere", phone: "555-555-555" ) }

	subject { @restaurant }
	it { should respond_to(:name)}
	it { should respond_to(:description)}
	it { should respond_to(:address)}
	it { should respond_to(:phone)}
	it { should respond_to(:user) }

	it { should be_valid }

	describe 'when name is blank' do
		before { @restaurant.name="" }
		it { should be_invalid }
	end

	describe 'when user_id is not present' do
		before { @restaurant.user_id=nil }
		it { should be_invalid }
	end
end
