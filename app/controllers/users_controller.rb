class UsersController < ApplicationController

  def index
    @users = User.all
    @user = User.new
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
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
