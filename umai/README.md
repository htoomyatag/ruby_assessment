# rubyapi-umai

Technology

ruby 3.0.1
sqlite
libraries please check in GemFile

How to run

Go to the project root directory
run bundle install to install required depencies
run rake db:create && rake db:migrate && rake db:seed to database ready
run rackup to run web server

Whats system do

TASK 1
 http://127.0.0.1:9292/posts/create_post
 can create post with 
 title content and author login IP etc
 with sucess 200 return and error validation 422
 if no user, will create new user

TASK 2
  http://127.0.0.1:9292/ratings/create_rating
  can add rating to post with rating value 1 to 5
  will return average rating number of rated post


TASK 3
  http://127.0.0.1:9292/posts/top_post_by_avg_rating
  Get top number of post by average rating


TASK 4
 http://127.0.0.1:9292/posts/ip_address_list
 Get posted IP address list with author login


TASK 5
http://127.0.0.1:9292/feedbacks/add_feedback
Add feedback with user_id or post_id, comment, owner_id
If owner already give feedback will return feedback list the same owner give

TASK 6
Please check in seed file
create
  10000 POST-FEEDBACK OWNER
  50 USER-FEEDBACK BY OWNER
  200000 POST CREATED BY 100 USER BY USING 5O IP


 TASK 7
 run rspec
 please check in spec/feature folder
 

 TASK 8
run sidekiq -e ${RACK_ENV:-development} -r .application.rb -C ./config/sidekiq.yml
will generate xml file with all feedback at every 9am

Additonals

I do not use framework like rails and sinatra
rack to power web application run in ruby
sqlite3 for database
standalone_migrations for table migrations
rake run rake test
dotenv to load environment variabled
activerecord for mapping tables
ffaker for seeding fake data
sidekiq for background job 
sidekiq-scheduler for job schedule 
rspec for testing
webrick for web server
nokogiri for export xml
httparty for HTTP emthod