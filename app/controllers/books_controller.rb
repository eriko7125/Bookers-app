class BooksController < ApplicationController
  def top
  end

  def index
    @book = Book.new
    @books = Book.all.order(created_at: :desc)
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "Book was successfully created."
    else
      @books = Book.all.order(created_at: :desc)
      render action: :index
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(show), notice: "Book was successfully updated."
  end

  def new
    @book = Book.new
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "Book was successfully destroyed."
  end

  def edit
    @book = Book.find(params[:id])
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end