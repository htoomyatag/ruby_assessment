# README

# Technology

- ruby 3.0.1
- Database Postgres
- Server Puma

# How to run

- Go to the project root directory
- run 'bundle install' to install required depencies
- run 'rake db:create && rake db:migrate && rake db:seed' to database ready
- run 'rails sever' to run puma web server

# Whats system do

Create Content with POST method 
- END POINT http://localhost:3000/api/v1/create_contents
- can create contents with Title, Published Date, Author, Summary, Content and Status draft or published
- If published date is today date or older date the status will be published
- If published date is future date, the status will be draft.


GET Published Contents 
- END POINT http://localhost:3000/api/v1/published_contents
- get list of published contents


User Interface
- END POINT http://localhost:3000/
- Can view all list of contents with Boostrap UI

Testing 
- run "bundle exec rspec"
- test create content with factory data
- test get content 


GEMS
- pg for database
- faker for seeding fake data
- sidekiq for background job
- sidekiq-scheduler for job schedule
- rspec for testing
- database cleaner for testing