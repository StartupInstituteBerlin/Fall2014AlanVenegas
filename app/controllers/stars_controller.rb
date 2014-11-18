class StarsController < ApplicationController

	def create
		@star = current_user.stars.build(restaurant_id: star_params[:restaurant_id], created: Time.now)
		@restaurant = Restaurant.find(star_params[:restaurant_id])
		respond_to do |format|
			if @star.save
				format.html { redirect_to restaurant_path(star_params[:restaurant_id]), notice: 'Star was successfully created.' }
				format.js   {}
				format.json { render json: @star, status: :created, location: @star }
			else
				format.html { render action: "restaurant#show" }
				format.json { render json: @star.errors, status: :unprocessable_entity }
			end
		end
		#redirect_to restaurant_path(star_params[:restaurant_id])
	end

	def destroy
		star = current_user.stars.find_by(restaurant_id: params[:restaurant_id])
		@restaurant = Restaurant.find(params[:restaurant_id])

		respond_to do |format|
			if !star
				format.html { redirect_to root_path, notice: 'Only the starring user can delete a star.' }
				format.js   {}
			elsif star.destroy
				format.html { redirect_to root_path, notice: 'Star succesfully deleted.' }
				format.js   {}
			end
		end
	end

	private

	def star_params
		params.permit(:restaurant_id)
	end
end
