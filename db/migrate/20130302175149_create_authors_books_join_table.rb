class CreateAuthorsBooksJoinTable < ActiveRecord::Migration
  def change
    create_table :authors_books, id: false do |table|
      table.integer :author_id
      table.integer :book_id
    end
    add_index :authors_books, [:author_id, :book_id], unique: true
  end
end
