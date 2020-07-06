class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
  end

  def index
  	@books = Book.all
  	@book = Book.new
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(book.id)
    else
    render action: :index
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "Book was successfully update."
    redirect_to book_path(book)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Book was successfully destroy."
      redirect_to books_path
    else
      render action: :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
