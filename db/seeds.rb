# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jun = User.create!(email: 'jun@example.com', password: 'password')
emi = User.create!(email: 'emi@example.com', password: 'password')

2.times do
    jun.articles.create!(
        title: Faker::Lorem.sentence(word_count: 5),
        content: Faker::Lorem.sentence(word_count: 100)
    )
end

2.times do
    emi.articles.create!(
        title: Faker::Lorem.sentence(word_count: 5),
        content: Faker::Lorem.sentence(word_count: 100)
    )
end
