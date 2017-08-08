class MechanismsController < ApplicationController

  def show
    @mechanism = Mechanism.find(params[:id])
    @favoriting = Favoriting.new
    @ownership = Ownership.new
  end
end
