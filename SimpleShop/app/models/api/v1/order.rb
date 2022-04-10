class Api::V1::Order < ApplicationRecord
	has_many :line_items, dependent: :destroy
	
end
