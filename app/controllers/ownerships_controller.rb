class OwnershipsController < ApplicationController
    def create
    @ownership = Ownership.new(user_id: current_user.id, game_id: params[:ownership][:game])
    if @ownership.save
    else
      @errors = @ownership.errors.full_messages
    end

  end
end
