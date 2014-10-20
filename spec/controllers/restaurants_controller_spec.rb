require 'rails_helper'


RSpec.describe RestaurantsController, :type => :controller do

	before do
		@user = FactoryGirl.create(:user)
		@restaurant = FactoryGirl.create(:restaurant)
	end

	describe 'GET #index' do

		it 'returns a list of restaurants' do
			get :index
			expect(response).to be_success
			expect(assigns(:restaurants)).to eq(Restaurant.all)
		end
	end

	describe 'GET #edit' do
		context 'when not logged in' do
			it 'redirects to index' do
				@request.env["devise.mapping"] = Devise.mappings[:user]

				get :edit, id: @restaurant.id

				expect(response).to have_http_status(302)
			end
		end
	end
end
