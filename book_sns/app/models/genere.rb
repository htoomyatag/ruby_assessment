class Genere < ApplicationRecord
	has_and_belongs_to_many :books, join_table: 'books_generes'

	validates :title, uniqueness: true, presence: true
end
