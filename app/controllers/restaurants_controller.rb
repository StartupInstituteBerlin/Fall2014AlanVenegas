class RestaurantsController < ApplicationController
	#before_action :authenticate_user!
	
	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(restaurant_params)
		if @restaurant.save
			flash[:notice] = "Restaurant created"
			redirect_to @restaurant
		else
			flash[:error] = "Restaurant created"
			redirect_to root_path
		end

	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update_attributes(restaurant_params)
			redirect_to @restaurant
		else
			redirect_to edit_restaurant_path(@restaurant)
		end

	end

	def destroy
		restaurant = Restaurant.find(params[:id])
		if restaurant.destroy
			flash[:notice] = "Restaurant destroyed"
		end
		redirect_to root_path
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :description, :address, :phone)
	end
end
