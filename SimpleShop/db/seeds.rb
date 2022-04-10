# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


User.destroy_all
users = User.create([
	{ email: 'admin@gmail.com', password:"password",admin:true }, 
	{ email: 'customer@gmail.com', password:"password" }
])
20.times do
	email = Faker::Internet.email
    password  = "password"
    User.create email: email,password: password
end

Api::V1::Currency.destroy_all
curriencies = Api::V1::Currency.create([
	{ title: 'Thai baht', currency_code:"THB" }, 
	{ title: 'Japanese yen', currency_code:"JPY" }, 
	{ title: 'Singapore dollar', currency_code:"SGD" }
])

Api::V1::Country.destroy_all
countries = Api::V1::Country.create([
	{ title: 'Thailand', country_code:"TH" }, 
	{ title: 'Japan', country_code:"JP" }, 
	{ title: 'Singapore', country_code:"SG"}
])

Api::V1::Tax.destroy_all
taxes = Api::V1::Tax.create([
	{ tax_rate: 0.07, tax_category:"Sales Tax" }, 
	{ tax_rate: 0.05, tax_category:"Sales Tax" }, 
	{ tax_rate: 0.10, tax_category:"Sales Tax" }
])


Api::V1::Region.destroy_all
regions = Api::V1::Region.create([
	{ title: 'Southeast Asia', country_id:"1",currency_id:"1",tax_id:"1"}, 
	{ title: 'Northeast Asia', country_id:"2",currency_id:"2",tax_id:"2"},
	{ title: 'Southeast Asia', country_id:"3",currency_id:"3",tax_id:"3"},
])


Api::V1::Store.destroy_all
10.times do
	title = Faker::FunnyName.name
    Api::V1::Store.create title: title,region_id: 1
end
10.times do
	title = Faker::FunnyName.name
    Api::V1::Store.create title: title,region_id: 2
end
10.times do
	title = Faker::FunnyName.name
    Api::V1::Store.create title: title,region_id: 3
end

10.times do
	title = Faker::Commerce.product_name
	description = Faker::Commerce.department
	image_url = Faker::LoremFlickr.image
	price = Faker::Commerce.price
	sku = Faker::Alphanumeric.alpha(number: 5).to_s+Faker::Number.within(range: 1..21).to_s
	stock = 99
    Api::V1::Product.create title: title, description: description,image_url: image_url,price: price,sku: sku,stock: stock, region_id: 1
end

10.times do
	title = Faker::Commerce.product_name
	description = Faker::Commerce.department
	image_url = Faker::LoremFlickr.image
	price = Faker::Commerce.price
	sku = Faker::Alphanumeric.alpha(number: 5).to_s+Faker::Number.within(range: 1..21).to_s
	stock = 99
    Api::V1::Product.create title: title, description: description,image_url: image_url,price: price,sku: sku,stock: stock, region_id: 2
end

10.times do
	title = Faker::Commerce.product_name
	description = Faker::Commerce.department
	image_url = Faker::LoremFlickr.image
	price = Faker::Commerce.price
	sku = Faker::Alphanumeric.alpha(number: 5).to_s+Faker::Number.within(range: 1..21).to_s
	stock = 99
    Api::V1::Product.create title: title, description: description,image_url: image_url,price: price,sku: sku,stock: stock, region_id: 3
end


Api::V1::Cart.destroy_all
#Api::V1::Order.destroy_all