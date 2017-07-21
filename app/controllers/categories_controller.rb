class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @favoriting = Favoriting.new
    @ownership = Ownership.new
  end
end
