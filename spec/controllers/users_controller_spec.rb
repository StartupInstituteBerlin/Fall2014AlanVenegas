require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

	let(:user) { FactoryGirl.create(:user) }

	describe "GET #dashboard" do
		context 'when logged in' do
			before(:each) do
				sign_in user
				get :dashboard
			end
			it "exists" do
				expect(response).to be_success
			end
			it "has all the restaurants" do
				user_restaurant = FactoryGirl.create(:restaurant, user: user)
				FactoryGirl.create(:restaurant)
				expect(assigns(:restaurants)).to eq([user_restaurant])
			end
		end

		xcontext "when not logged in" do
			before do
				get :dashboard
			end
			it "renders the restaurant index" do
				expect(response).to render_template("restaurants/index")
			end
		end
	end
end
