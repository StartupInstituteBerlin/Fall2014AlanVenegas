require 'rails_helper'

RSpec.describe User, :type => :model do

	before { @user = User.new(name: "Some user", email: "some@email.com",
														password: "holahola", password_confirmation: "holahola")
					 }

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:restaurants) }

	it { should be_valid } 

	describe 'when name is blank' do
		before { @user.name="" }
		it { should be_invalid }
	end

	describe 'when email is blank' do
		before { @user.email="" }
		it { should be_invalid }
	end
end
