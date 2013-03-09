class BooksController < ApplicationController
  def index
    @books = Book.paginate(page: params[:page], per_page: 10)
    @page_title = t('titles.books.index')
  end

  def show
    @book = Book.find(params[:id])
    @page_title = @book.title
  end

  def new
    @book = Book.new
    @authors = Author.order(:name)
    @page_title = t('titles.books.new')
  end

  def edit
    @book = Book.find(params[:id])
    @authors = Author.order(:name)
    @page_title = @book.title
  end

  def create
    @book = Book.new(params[:book])

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.authors.destroy_all unless params[:book].has_key?('author_ids')

    if @book.update_attributes(params[:book])
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_url
  end
end
