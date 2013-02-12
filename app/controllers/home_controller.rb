class HomeController < ApplicationController
  def index
  end
  def catalog
    @books = Book.all
  end
end
