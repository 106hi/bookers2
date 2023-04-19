class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @book.user = current_user
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
    @book.user = @books.user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body,:profile_image)
  end
end
