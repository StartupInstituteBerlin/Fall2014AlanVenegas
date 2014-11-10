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
		@restaurant = current_user.restaurants.find_by(id: params[:id])
		unless @restaurant
			flash[:alert] = "Only the owner can edit a restaurant"
			redirect_to root_path
		end
	end

	def update
		@restaurant = current_user.restaurants.find_by(id: params[:id])
		if !@restaurant
			flash[:alert] = "Only the owner can edit a restaurant"
			redirect_to root_path
		elsif @restaurant.update_attributes(restaurant_params)
			redirect_to @restaurant
		else
			flash[:error] = "Error updating restaurant"
			redirect_to root_path
		end

	end

	def destroy
		restaurant = current_user.restaurants.find_by(id: params[id])
		if !restaurant
			flash[:alert] = "Only the owner can edit a restaurant"
			redirect_to restaurant_path(restaurant)
		elsif restaurant.destroy
			flash[:notice] = "Restaurant destroyed"
			redirect_to root_path
		else
			flash[:error] = "Error destroying restaurant"
			redirect_to root_path
		end
	end

	private

	def restaurant_params
		params.require(:restaurant).permit(:name, :description, :address, :phone)
	end
end
