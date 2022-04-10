# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   

User.create(user_name: "aokf", email:"aokaok@aokaok.com",password:"password123")
User.create(user_name: "bokf", email:"bokbok@aokaok.com",password:"password123")
User.create(user_name: "cokf", email:"cokcok@aokaok.com",password:"password123")

Publisher.create(full_name: "pubisher_a")
Publisher.create(full_name: "pubisher_b")
Publisher.create(full_name: "pubisher_c")
Publisher.create(full_name: "pubisher_d")
Publisher.create(full_name: "pubisher_e")

Author.create(first_name: "fname_a", last_name: "lastname_a")
Author.create(first_name: "fname_b", last_name: "lastname_b")
Author.create(first_name: "fname_c", last_name: "lastname_c")
Author.create(first_name: "fname_d", last_name: "lastname_d")
Author.create(first_name: "fname_e", last_name: "lastname_e")

Genere.create(title: "genA")
Genere.create(title: "genB")
Genere.create(title: "genC")
Genere.create(title: "genD")
Genere.create(title: "genE")

Follow.create(following_id: 1,follower_id:2)
Follow.create(following_id: 1,follower_id:3)
Follow.create(following_id: 2,follower_id:3)
Follow.create(following_id: 3,follower_id:1)

Book.create(title: "Luke", total_pages: "100", isbn: "123isbn" ,published_date: "12-08-1993", price:20.25 ,publisher_id:1)
Book.create(title: "auke", total_pages: "150", isbn: "456isbn" ,published_date: "12-09-1993", price:10.25 ,publisher_id:2)
Book.create(title: "buke", total_pages: "200", isbn: "123yisbn" ,published_date: "12-28-1993", price:50.25 ,publisher_id:3)
Book.create(title: "fuke", total_pages: "300", isbn: "123hisbn" ,published_date: "12-18-1993", price:100.25 ,publisher_id:4)
Book.create(title: "uuke", total_pages: "400", isbn: "123hisbn" ,published_date: "12-04-1993", price:200.25 ,publisher_id:5)

# BookGenere.create(book_id: 1,genere_id:1)
# BookGenere.create(book_id: 2,genere_id:2)
# BookGenere.create(book_id: 3,genere_id:3)
# BookGenere.create(book_id: 4,genere_id:4)
# BookGenere.create(book_id: 5,genere_id:5)

# AuthorBook.create(book_id: 1,author_id:1)
# AuthorBook.create(book_id: 2,author_id:2)
# AuthorBook.create(book_id: 3,author_id:3)
# AuthorBook.create(book_id: 4,author_id:4)
# AuthorBook.create(book_id: 5,author_id:5)

Review.create(rate: 1,title:"aok",description:"aaaaaaaaaaaaaaaaa",user_id:1,book_id:1)
Review.create(rate: 3,title:"bok",description:"bbbbbbbbbbbbbbbbb",user_id:2,book_id:2)
Review.create(rate: 5,title:"cok",description:"ccccccccccccccccc",user_id:3,book_id:3)

puts "seed ok"