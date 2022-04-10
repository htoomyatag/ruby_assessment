class Api::V1::Product < ApplicationRecord
	has_many :line_items, dependent: :destroy
	belongs_to :region
end
