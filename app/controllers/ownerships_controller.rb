class OwnershipsController < ApplicationController
    def create
    @ownership = Ownership.new(user_id: current_user.id, game_id: params[:ownership][:game])
    if @ownership.save
      flash[:notice] ="'#{@ownership.game.title}' was added to your collection."
      redirect_to params[:ownership][:path]
    else
      flash[:notice] = "'#{@ownership.game.title}' is already in your collection!"
      redirect_to params[:ownership][:path]
    end

  end
end
