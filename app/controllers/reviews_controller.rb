class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    if current_user.has_reviewed? @restaurant
      flash[:notice] = "You've already reviewed this restaurant!"
      redirect_to restaurants_path
    else
      @review = Review.new
    end
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.create(review_params)
    @review.restaurant_id = @restaurant.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to restaurants_path
    else
      if @review.errors[:user]
        flash[:notice] = "You've already reviewed this restaurant!"
        redirect_to restaurants_path
      else
        render 'new'
      end
    end
  end

  private
    def review_params
      params.require(:review).permit(:thoughts, :rating, :current_user)
    end
end
