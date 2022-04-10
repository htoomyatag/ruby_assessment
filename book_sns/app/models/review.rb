class Review < ApplicationRecord
	belongs_to :user
	belongs_to :book

	validates :title, :description,:rate,:user_id,:book_id, presence: true
	validates_length_of :description, minimum: 10, too_short: 'Your review must be at least 10 words.'
	validates :rate, :inclusion => { :in => 1..5 }
	
    scope :search_by_input, -> (keyword) { where("description like ? OR title = ? OR user_id = ?", "%#{keyword}%", "#{keyword}", "#{keyword}")}
    scope :filter_by_following_user, -> (following_user_ids) { where(user_id: following_user_ids)}
end
