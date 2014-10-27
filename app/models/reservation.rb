class Reservation < ActiveRecord::Base
	belongs_to :restaurant
	validates :email, presence: true
	validates :date_and_time, presence: true
	validates :restaurant_id, presence: true

end
