class Publisher < ApplicationRecord
	has_many :books

	validates :full_name, uniqueness: true, presence: true
end
