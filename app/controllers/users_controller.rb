class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.new(user_params)
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private
  def user_params
    params.require(:user).permit(:title,:body,:name,:inrtoduction)
  end
end
