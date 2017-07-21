class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/login'
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_edit_params)
    redirect_to user_path(@user)
  end

  def show
    @user = User.find(params[:id])
    @favoriting = Favoriting.new
    @ownership = Ownership.new
    redirect_to '/login' if @user != current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end

  def user_edit_params
    params.require(:user).permit(:username, :bio)
  end
end
