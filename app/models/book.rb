class Book < ActiveRecord::Base
  attr_accessible :description, :isbn, :publishing_date, :title, :pages, :cover, :author_ids

  has_and_belongs_to_many :authors

  accepts_nested_attributes_for :authors

  has_attached_file :cover, styles: { medium: '230x230>', edit: '165x165>', thumb: '60x60>' },
                    url: '/uploads/img/books/:id/:style/:basename.:extension',
                    path: ':rails_root/public/uploads/img/books/:id/:style/:basename.:extension',
                    default_url: '/assets/books/default/:style/question-mark.gif'
end
