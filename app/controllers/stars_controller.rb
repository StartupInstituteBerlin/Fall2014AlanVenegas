class StarsController < ApplicationController

	def create
		@star = current_user.stars.build(restaurant_id: star_params[:restaurant_id], created: Time.now)
		if @star.save
			flash[:notice]="Restaurant starred succesfully"
		else
			flash[:error]="Error starring restaurant"
		end
		redirect_to restaurant_path(star_params[:restaurant_id])
	end

	def create
		@star = current_user.stars.build(restaurant_id: star_params[:restaurant_id], created: Time.now)
		if @star.save
			flash[:notice]="Restaurant starred succesfully"
		else
			flash[:error]="Error starring restaurant"
		end
		redirect_to restaurant_path(star_params[:restaurant_id])
	end

	def destroy
		star = current_user.stars.find_by(restaurant_id: params[:restaurant_id])
		if !star
			flash[:alert] = "Only the starring user can unstar a restaurant"
		elsif star.destroy
			flash[:notice] = "Restaurant unstarred"
		else
			flash[:error] = "Error destroying star"
		end
		redirect_to restaurant_path(params[:restaurant_id])
	end

	private

	def star_params
		params.permit(:restaurant_id)
	end
end
