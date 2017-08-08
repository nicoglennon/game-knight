class FavoritingsController < ApplicationController

  def create
    @favoriting = Favoriting.new(user_id: current_user.id, game_id: params[:favoriting][:game])
    if @favoriting.save
      p @favoriting.game.title
      flash[:notice] = "'#{@favoriting.game.title}' was added to your favorites."
      redirect_to params[:favoriting][:path]
    else
      flash[:notice] = "You already favorited '#{@favoriting.game.title}'!"
      redirect_to params[:favoriting][:path]
    end

  end
end
