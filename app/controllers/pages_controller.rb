class PagesController < ApplicationController
  def index
    @favoriting = Favoriting.new
    @ownership = Ownership.new
  end

  def search
  end

end
