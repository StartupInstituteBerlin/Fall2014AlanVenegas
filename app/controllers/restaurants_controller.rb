class RestaurantsController < ApplicationController

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
			redirect_to @restaurant
		else 
			redirect_to root_path
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])

	end
	
	def update
	end

	def destroy
	end

	private

		def restaurant_params
			params.require(:restaurant).permit(:name, :description, :address, :phone)
		end
end
