class Author < ActiveRecord::Base
  attr_accessible :name, :book_ids
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :books
end
