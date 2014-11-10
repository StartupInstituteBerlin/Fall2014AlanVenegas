require 'rails_helper'

RSpec.describe Star, :type => :model do

	before { @star = FactoryGirl.build(:star) }

	subject { @star }

	it { should respond_to(:user) }
	it { should respond_to(:restaurant) }
	it { should respond_to(:created) }

	it { should be_valid } 

end
