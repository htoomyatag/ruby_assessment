require './app/models/user'
require './app/models/post'
require './app/models/feedback'

require 'ffaker'

# 10000 POST-FEEDBACK OWNER
# 50 USER-FEEDBACK BY OWNER
# 200000 POST CREATED BY 100 USER BY USING 5O IP


100.times do
	username = FFaker::Name.unique.name
	password  = 'password'
    
    user = User.create username: username,password: password

	50.times do
		ip_address = FFaker::Internet.ip_v4_address
		40.times do
		    title = FFaker::Lorem.word
		    content = FFaker::Lorem.paragraph
			Post.create title: title, content: content, user_id:user.id, author_ip: ip_address
	    end
	end

	100.times do
		 owner_comment = FFaker::Lorem.paragraph
		 owner_id = rand(1..50)
	     post_id = rand(1..200000)
		 Feedback.create post_id:post_id, owner_comment:owner_comment, owner_id: owner_id
	end

end


50.times do
   owner_comment = FFaker::Lorem.paragraph
   owner_id = rand(1..50)
   user_id = rand(1..200000)
   Feedback.create user_id:user_id, owner_comment:owner_comment, owner_id: owner_id
end



