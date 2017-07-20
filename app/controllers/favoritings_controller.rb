class FavoritingsController < ApplicationController

  def create
    @favoriting = Favoriting.new(user_id: current_user.id, game_id: params[:favoriting][:game])
    if @favoriting.save
    else
      @errors = @favoriting.errors.full_messages
    end

  end
end
