class ReviewsController < ApplicationController

  def index
    @reviews = Review.order("id DESC")  # ordered by most recent
  end

  def new
    @review = Review.new
  end

  def create
    @game = Game.find(review_params[:game_id])
    @review = Review.new(review_params)
    if @review.save
      redirect_to game_path(@game)
    else
      @errors = ["Reviews require a title and body."]
      render :'games/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :game_id, :author_id)
  end
end
