class FavoritingsController < ApplicationController

  def create
    if request.xhr?
      p 'xhr'
      @favoriting = Favoriting.new(user_id: current_user.id, game_id: params[:game])
      if @favoriting.save
         render body: nil, :status => 200
      else
        render body:nil, :status => 418
      end
    else
      p 'http'
      @favoriting = Favoriting.new(user_id: current_user.id, game_id: params[:favoriting][:game])
      if @favoriting.save
        flash[:notice] = "Game added to your favorites"
        redirect_to params[:favoriting][:path]
      else
        flash[:notice] = "You already favorited this game"
        redirect_to params[:favoriting][:path]
      end
    end
  end
end
