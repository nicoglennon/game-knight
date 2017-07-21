class FavoritingsController < ApplicationController

  def create
    p params
    @favoriting = Favoriting.new(user_id: current_user.id, game_id: params[:favoriting][:game])
    if @favoriting.save
      redirect_to params[:favoriting][:path]
    else
      @errors = @favoriting.errors.full_messages
      redirect_to params[:favoriting][:path]
    end

  end
end
