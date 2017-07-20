class FavoritingsController < ApplicationController

  def create
    @favoriting = Favoriting.create(user_id: current_user.id, game_id: params[:favoriting][:game])
    p @favoriting

  end
end
