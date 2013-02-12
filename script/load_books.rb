Book.delete_all
Book.transaction do
  def rand_date
    Time.at(0.0 + rand * (Time.now.to_f - 0.0)).strftime('%Y-%m-%d')
  end

  books = [
    {
        title: 'Agile Web Development with Rails (4th edition)',
        description: 'Rails just keeps on changing. Rails 3 and Ruby 1.9 bring hundreds
of improvements, including new APIs and substantial performance enhancements. The fourth
edition of this award-winning classic has been reorganized and refocused so it’s more
useful than ever before for developers new to Ruby and Rails.',
        publishing_date: '2011-03-31',
        isbn: '978-1-93435-654-8',
        author: 'Sam Ruby',
        pages: 480
    },
    {
        title: 'Agile in a Flash: Speed-Learning Agile Software Development',
        description: 'The best agile book isn’t a book: Agile in a Flash
is a unique deck of index cards that fit neatly in your pocket. You can
tape them to the wall. Spread them out on your project table. Get stains
on them over lunch. These cards are meant to be used, not just read.',
        publishing_date: '2011-01-15',
        isbn: '978-1-93435-671-5',
        author: 'Jeff Langr and Tim Ottinger',
        pages: 110
    }
  ]

  books.each { |book| Book.create book }

  (1..100).each do |i|
    Book.create(title: "Title #{i}", description: "Lorem #{i} ipsum dolor sit amet, consectetur
adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud exercitation ullamco", publishing_date: rand_date,
                isbn: rand(20000000..4000000000), author: "John Doe #{i}", pages: rand(20..600))
  end
end