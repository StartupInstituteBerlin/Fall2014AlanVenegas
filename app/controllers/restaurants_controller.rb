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
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update_attributes(restaurant_params)
      redirect_to @restaurant
    else
      redirect_to edit_restaurant_path(@restaurant)
    end

	end

	def destroy
	end

	private

		def restaurant_params
			params.require(:restaurant).permit(:name, :description, :address, :phone)
		end
end
