class Api::V1::Country < ApplicationRecord
	has_many :regions
end
