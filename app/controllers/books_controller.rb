class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @book.user_id = current_user.id
  end

  def show
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title,:body,:image)
  end


end
