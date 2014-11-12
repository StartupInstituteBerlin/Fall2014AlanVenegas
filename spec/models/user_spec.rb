require 'rails_helper'

RSpec.describe User, :type => :model do

	before { @user = FactoryGirl.build(:user) }

	subject { @user }

 
	it { is_expected.to respond_to(:name) }
	it { is_expected.to respond_to(:email) }
	it { is_expected.to respond_to(:restaurants) }
	it { is_expected.to respond_to(:role) }
	it { is_expected.to respond_to(:stars) }
	it { is_expected.to respond_to(:starred_restaurants) }

	it { is_expected.to be_valid } 

	describe 'when name is blank' do
		before { @user.name="" }
		it { is_expected.to be_invalid }
	end

	describe 'when email is blank' do
		before { @user.email="" }
		it { is_expected.to be_invalid }
	end

	it { is_expected.to_not be_owner }
	it { is_expected.to be_patron }
	
	describe 'when promoted to owner' do
		before { @user.role="owner"}

		it { is_expected.to be_owner}
		it { is_expected.not_to be_patron }
	end
end
