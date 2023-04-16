class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)
    @user.user_id = current_user.id
    @user.save
    redirect_to user_path(user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :inrtoduction, :profile_image)
  end
end
