class Restaurant < ActiveRecord::Base
	belongs_to :user
	has_many :reservations
	validates :name, presence: true
	validates_length_of :name, minimum: 3
	validates :user_id, presence: true
	accepts_nested_attributes_for :reservations
end
