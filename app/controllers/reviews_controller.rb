class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    if current_user.owns? @restaurant
      flash[:notice] = 'You can\'t review your own restaurant!'
      redirect_to '/'
    else
      if current_user.has_reviewed? @restaurant
        flash[:notice] = "You've already reviewed this restaurant!"
        redirect_to restaurants_path
      else
        @review = Review.new
      end
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

  def edit
    @review = Review.find(params[:id])
    p @review
    p current_user
    @restaurant = Restaurant.find(@review.restaurant_id)
    p @restaurant
    if current_user.owns?(@review)
      render 'edit'
    else
      flash[:notice] = 'Only the review owner can edit this review'
      redirect_to '/'
    end
  end

  def update
    #@restaurant = Restaurant.find(params[:id])
    @review = Review.find(params[:id])
    if current_user.owns?(@review)
      @review.update(review_params)
      redirect_to '/'
    else
      flash[:notice] = 'Only the review owner can edit this review'
      redirect_to '/'
    end
  end


  private
    def review_params
      params.require(:review).permit(:thoughts, :rating, :current_user)
    end
end
