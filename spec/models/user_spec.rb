require 'rails_helper'

RSpec.describe User, :type => :model do

	before { @user = Restaurant.new }

	it { should respond_to(:name) }
	it { should respond_to(:restaurants) }
end
