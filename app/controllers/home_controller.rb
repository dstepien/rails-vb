class HomeController < ApplicationController
  def index
  end
  def catalog
    @books = Book.paginate(page: params[:page], per_page: 20)
  end
end
