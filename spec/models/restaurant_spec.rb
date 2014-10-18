require 'rails_helper'

RSpec.describe Restaurant, :type => :model do

	before { @restaurant = Restaurant.new(name: "Some restaurant", description: "Some characteristics",
																				address: "Somewhere", phone: "555-555-555" ) }

	subject { @restaurant }
	it { should respond_to(:name)}
	it { should respond_to(:description)}
	it { should respond_to(:address)}
	it { should respond_to(:phone)}

	describe 'when name is not blank' do
		it { should be_valid }
	end

	describe 'when name is blank' do
		before { @restaurant.name="" }
		it { should be_invalid }
	end
end
