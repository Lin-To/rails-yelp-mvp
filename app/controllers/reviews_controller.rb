class ReviewsController < ApplicationController
  # She/He can add a new review to a restaurant
  # GET "restaurants/38/reviews/new"
  # POST "restaurants/38/reviews"

  def index
    @reviews = Review.all
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # so we need find the relevant restaurant by finding its id
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant_id = @restaurant.id
    # this solves for GET "restaurants/38/reviews/new" POST "restaurants/38/reviews"
    if @review.save
      redirect_to @restaurant, notice: 'review was successfully created.'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
