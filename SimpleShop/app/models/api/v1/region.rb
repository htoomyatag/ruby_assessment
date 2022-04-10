class Api::V1::Region < ApplicationRecord
	 belongs_to :country
	 belongs_to :currency
	 belongs_to :tax
	 has_many :products
end
