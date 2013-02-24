class Book < ActiveRecord::Base
  attr_accessible :description, :isbn, :publishing_date, :title, :author, :pages, :cover

  has_attached_file :cover, styles: { medium: '300x300>', thumb: '60x60>' },
                    url: '/assets/books/:id/:style/:basename.:extension',
                    path: ':rails_root/public/assets/books/:id/:style/:basename.:extension',
                    default_url: '/assets/books/:style/missing.gif'
end
