class Post < ActiveRecord::Base

	belongs_to :user
	has_many :feedbacks

	validates :title,:user_id,:content,:author_ip, presence: true



end