class AddAuthorAndPagesToBooks < ActiveRecord::Migration
  def change
    add_column :books, :author, :string
    add_column :books, :pages, :integer
  end
end
