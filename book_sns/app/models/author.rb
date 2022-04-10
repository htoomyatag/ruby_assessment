class Author < ApplicationRecord
	has_and_belongs_to_many :books, join_table: 'authors_books'
	
	validates_uniqueness_of :first_name, scope: :last_name
	validates :first_name, :last_name, presence: true
end
