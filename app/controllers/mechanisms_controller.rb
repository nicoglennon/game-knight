class MechanismsController < ApplicationController

  def show
    @mechanism = Mechanism.find(params[:id])
  end
end
