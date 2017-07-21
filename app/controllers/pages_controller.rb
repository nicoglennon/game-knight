class PagesController < ApplicationController
  def index
    @favoriting = Favoriting.new
    @ownership = Ownership.new
    @popular_games = Game.all
    # p @popular_games
  end

  def search
  end

end
