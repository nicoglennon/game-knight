class ReviewsController < ApplicationController

  def index
    @reviews = Review.order("id DESC")  # ordered by most recent
  end

end
