class User < ApplicationRecord
	devise :database_authenticatable, :registerable, :validatable

	has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
	has_many :followers, through: :follower_relationships, source: :follower
	has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
	has_many :following, through: :following_relationships, source: :following
	has_many :reviews

	validates :user_name,:email,:password, presence: true
	validates :email, uniqueness: true
	validates :user_name, uniqueness: true

	def generate_jwt
		JWT.encode({id: id, exp: 60.days.from_now.to_i}, Rails.application.secrets.secret_key_base)
  end
end