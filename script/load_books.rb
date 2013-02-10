Book.delete_all
Book.transaction do
  def rand_date
    Time.at(0.0 + rand * (Time.now.to_f - 0.0)).strftime('%Y-%m-%d')
  end

  (1..100).each do |i|
    Book.create(title: "Title #{i}", description: "Lorem #{i} ipsum dolor sit amet, consectetur
adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
Ut enim ad minim veniam, quis nostrud exercitation ullamco", publishing_date: rand_date,
                isbn: rand(20000000..4000000000))
  end
end