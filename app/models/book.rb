class Book < ActiveRecord::Base
  attr_accessible :description, :isbn, :publishing_date, :title, :author, :pages
end
