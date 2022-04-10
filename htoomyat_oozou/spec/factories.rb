FactoryBot.define do

  factory :random_content, class: Content do
    title { Faker::Book.title }
    author { Faker::Book.author }
    summary { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    published_date { Date.today.strftime("%Y-%m-%d") }
    status { "published" }
  end
end
