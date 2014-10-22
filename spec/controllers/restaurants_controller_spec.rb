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
		before do
			@request.env["devise.mapping"] = Devise.mappings[:user]

		end
		context 'when not logged in' do
			it 'redirects to index' do
				get :edit, id: @restaurant.id
				expect(response).to redirect_to(new_user_session_path)

			end
		end
		context 'when logged in' do
			context 'trying to access his own restaurant' do
				it 'returns http 200' do
					sign_in @restaurant.user
					get :edit, id: @restaurant.id
					expect(response).to have_http_status(200)
				end
			end
			context 'trying to access a restaurant he does not own' do
				it 'redirects to index' do
					sign_in @user
					get :edit, id: @restaurant.id
					expect(response).to redirect_to(restaurant_path(@restaurant))

				end
			end
		end
	end
end
