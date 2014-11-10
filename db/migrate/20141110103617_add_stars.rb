class AddStars < ActiveRecord::Migration
	def change
		create_table :stars do |t|
			t.belongs_to :user
			t.belongs_to :restaurant
			t.datetime :created
			t.timestamps
		end

	end
end
