class PagesController < ApplicationController
  def index
    @favoriting = Favoriting.new
    @ownership = Ownership.new
    @popular_games = Game.popular
    @best_games = Game.best_selling
  end

  def search
  end

end
