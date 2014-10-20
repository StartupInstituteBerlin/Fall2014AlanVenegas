class Restaurant < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true
	validates_length_of :name, minimum: 3
	validates :user_id, presence: true
end
