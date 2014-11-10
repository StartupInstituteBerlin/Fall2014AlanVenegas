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
			it 'redirects to sign in' do
				get :edit, id: @restaurant.id
				expect(response).to redirect_to(new_user_session_path)

			end
		end
		context 'when logged in' do
			context 'trying to edit his own restaurant' do
				it 'returns http 200' do
					sign_in @restaurant.user
					get :edit, id: @restaurant.id
					expect(response).to have_http_status(200)
				end
			end
			context 'trying to edit a restaurant he does not own' do
				before do
					sign_in @user
					get :edit, id: @restaurant.id
				end
				it 'redirects to index' do
					expect(response).to redirect_to(root_path)
				end
				it 'displays an alert' do
					expect(request.flash[:alert]).not_to be_nil
				end
			end
		end
	end

	describe 'PUT #update' do
		context 'when not logged in' do
			it 'redirects to sign in' do
				put :update, id: @restaurant.id
				expect(response).to redirect_to(new_user_session_path)
			end
		end
		describe 'when logged in' do
			context 'trying to update his own restaurant' do
				before do
					sign_in @restaurant.user
					put :update, id: @restaurant.id, restaurant: {name: "New name"}
				end
				it 'updates the information' do
					#expect(response).to have_http_status(200)
					@restaurant.reload
					expect(@restaurant.name).to eq("New name")
				end
			end

			context 'trying to update a restaurant he does not own' do
				it 'redirects to index' do
					sign_in @user
					put :update, id: @restaurant.id, restaurant: {name: "New name"}
					expect(response).to redirect_to(root_path)
					expect(request.flash[:alert]).not_to be_nil
				end
			end
		end
	end
end
