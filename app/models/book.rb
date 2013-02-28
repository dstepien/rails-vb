class Book < ActiveRecord::Base
  attr_accessible :description, :isbn, :publishing_date, :title, :author, :pages, :cover

  has_attached_file :cover, styles: { medium: '230x230>', edit: '165x165>', thumb: '60x60>' },
                    url: '/images/books/:id/:style/:basename.:extension',
                    path: ':rails_root/public/images/books/:id/:style/:basename.:extension',
                    default_url: '/images/books/default/:style/missing.gif'
end
