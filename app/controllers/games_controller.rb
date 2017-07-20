class GamesController < ApplicationController

  def index
    if params[:search]
      @games = Game.search(params[:search])
    # elsif # ADVANCED SEARCH
    #   @games = Game.advanced_search(params)
    else
      @games = Game.all
    end
  end

  def show
    @game = Game.find(params[:id])
    @review = Review.new
  end
end
