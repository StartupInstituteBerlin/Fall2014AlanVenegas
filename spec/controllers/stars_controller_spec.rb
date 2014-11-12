require 'rails_helper'

RSpec.describe StarsController, :type => :controller do

	before do
		@restaurant = FactoryGirl.create(:restaurant)
		sign_in @restaurant.user
	end

	describe 'POST #create' do
		it 'adds a new star' do
			post :create, restaurant_id: @restaurant.id
			expect(response).to redirect_to(restaurant_path(@restaurant.id))
		end
	end

end
