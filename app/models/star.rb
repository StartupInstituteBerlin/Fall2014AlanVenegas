class Star < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user
	validates :restaurant_id, uniqueness: {scope: :user_id}
  model_name.instance_variable_set(:@route_key, 'star')
end
