# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)








50.times do

    title = Faker::Book.title
    published_date = Faker::Date.between(from: 5.days.ago, to: Date.today) 
    author = Faker::Book.author
    summary = Faker::Lorem.sentence
    content = Faker::Lorem.paragraph
    status_published = "published"

     #published contents 50
     Content.create title:title, author:author, summary: summary,content: content, status: status_published,published_date: published_date

end


50.times do

    title = Faker::Book.title
    published_date = Faker::Date.between(from: Date.today+1, to:Date.today+10 ) 
    author = Faker::Book.author
    summary = Faker::Lorem.sentence
    content = Faker::Lorem.paragraph
    status_draft = "draft"
 
 #draft contents 50
 Content.create title:title, author:author, summary: summary,content: content, status: status_draft,published_date: published_date
end

puts "draft contents and published content seeded 50 each"