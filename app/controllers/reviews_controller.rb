class ReviewsController < ApplicationController

  def index
    @reviews = Review.order("id DESC").all  # ordered by most recent
  end
end
