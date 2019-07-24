class RestaurantsController < ApplicationController
  # A visitor can see the list of all restaurants.
  before_action :set_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all
  end
  # She/He can add a new restaurant, and be redirected to the show view of that new restaurant.
  # GET "restaurants/new"
  # POST "restaurants"
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: 'restaurant was successfully created.'
    else
      render :new
    end
  end
  # She/He can see the details of a restaurant, with all the reviews related to the restaurant.
  # GET "restaurants/38"
  def show
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
