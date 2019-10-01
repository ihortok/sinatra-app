10.times do |i|
  Author.create!(first_name: Faker::Name.first_name,
                 last_name: Faker::Name.last_name,
                 country: Faker::Nation.nationality,
                 age: Faker::Number.between(from: 23, to: 99),
                 description: Faker::Quote.famous_last_words)
end
