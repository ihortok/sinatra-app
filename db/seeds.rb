img_links = [
  'https://about.canva.com/wp-content/uploads/sites/3/2015/01/art_bookcover.png',
  'https://damonza.com/wp-content/uploads/portfolio/fiction/World-Whisperer.jpg',
  'https://damonza.com/wp-content/uploads/portfolio/fiction/A-Dirty-Shame_Ebook.jpg',
  'https://damonza.com/wp-content/uploads/portfolio/fiction/A-Mage%27s-Stand_2.jpg',
  'https://damonza.com/wp-content/uploads/portfolio/fiction/A-Shark-in-Calle-Ocho.jpg',
  'https://damonza.com/wp-content/uploads/portfolio/fiction/A_Heart_For_A_HeartEbook.jpg',
  'https://damonza.com/wp-content/uploads/portfolio/fiction/AlphabetSoup3b.jpg'
]

10.times do |i|
  Author.create!(id: i + 1,
                 first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name,
                 country: Faker::Nation.nationality,
                 age: Faker::Number.between(from: 23, to: 99),
                 description: Faker::Quote.famous_last_words)
end

7.times do |i|
  Book.create!(name: Faker::Book.title,
               price: Faker::Number.between(from: 99, to: 799),
               img_url: img_links[i],
               description: Faker::Quotes::Shakespeare.hamlet_quote,
               author: Author.find(rand(1..10)))
end
