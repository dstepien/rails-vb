require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test "author name must not be empty" do
    author = Author.new
    assert author.invalid?
    assert author.errors[:name].any?
  end

  test "author must have unique name" do
    author_1 = Author.new name: 'John Doe'
    author_1.save
    author_2 = Author.new name: 'John Doe'

    assert author_1.valid?
    assert author_2.invalid?
  end
end
