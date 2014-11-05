class RestaurantsController < ApplicationController
	before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy]
	
	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@reservation = Reservation.new(restaurant_id:@restaurant.id)
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = current_user.restaurants.build(restaurant_params)
		if @restaurant.save
			flash[:notice] = "Restaurant created"
			redirect_to @restaurant
		else
			flash[:error] = "Error creating restaurant"
			redirect_to root_path
		end

	end

	def edit
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.user != current_user
			flash[:alert] = "Only the owner can edit a restaurant"
			redirect_to restaurant_path(@restaurant)
		end
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		if @restaurant.user != current_user
			flash[:alert] = "Only the owner can edit a restaurant"
			redirect_to restaurant_path(@restaurant)
		elsif @restaurant.update_attributes(restaurant_params)
			redirect_to @restaurant
		else
			flash[:error] = "Error updating restaurant"
			redirect_to edit_restaurant_path(@restaurant)
		end
	end

	def destroy
		restaurant = Restaurant.find(params[:id])
		if restaurant.user != current_user
			flash[:alert] = "Only the owner can edit a restaurant"
			redirect_to restaurant_path(restaurant)
		end

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
