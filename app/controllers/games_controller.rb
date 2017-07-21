class GamesController < ApplicationController

  def index
    if params[:search]
      @search = params[:search]
      @games = Game.search(@search)
    # elsif # ADVANCED SEARCH
    #   @games = Game.advanced_search(params)
    else
      @search = nil
      @games = Game.all
    end
    @favoriting = Favoriting.new
    @ownership = Ownership.new
  end

  def show
    @favoriting = Favoriting.new
    @ownership = Ownership.new
    @game = Game.find(params[:id])
    @review = Review.new
  end
end
