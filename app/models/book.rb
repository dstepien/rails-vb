class Book < ActiveRecord::Base
  attr_accessible :description, :isbn, :publishing_date, :title, :author, :pages, :cover

  has_attached_file :cover, styles: { medium: '300x300>', thumb: '100x100>' },
                    url: '/assets/books/:id/:style/:basename.:extension',
                    path: ':rails_root/public/assets/books/:id/:style/:basename.:extension',
                    default_url: '/images/:style/missing.png'
end
