class Feedback < ActiveRecord::Base

    belongs_to :user
    belongs_to :post	

    validates :owner_comment, uniqueness: {  scope: [ :user_id, :owner_id ]}
    validates :owner_comment, uniqueness: {  scope: [ :post_id, :owner_id ]}


end