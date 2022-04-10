class Book < ApplicationRecord
	has_and_belongs_to_many :authors, join_table: 'authors_books'
	has_and_belongs_to_many :generes, join_table: 'books_generes'
	has_many :reviews
	belongs_to :publisher
	
	validates :isbn, uniqueness: true
	validates :title, :isbn,:total_pages,:published_date,:price,:publisher_id, presence: true
end
