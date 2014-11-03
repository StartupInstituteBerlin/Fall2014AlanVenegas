require 'rails_helper'

RSpec.describe "routing to dashboard", type: :routing do
	context "when not logged in" do
		before(:each) do
			request.env["devise.mapping"] = Devise.mappings[:user]
		end
		it "routes to the restaurant index" do
			expect(get: "/").to route_to(controller: "restaurants", action: "index")
		end	
	end
end