require_relative './base_controller.rb'

class UsersController < BaseController


  #http://127.0.0.1:9292/users/create_user
  def create_user

    username = params['user']['username']
    password = params['user']['password']

    user = User.create(username: username, password: password)
    user.save
    status_success
  end


  #http://127.0.0.1:9292/users/authenticate
  def authenticate

    username = params['user']['username']
    password = params['user']['password']

    user = User.find_by_username(username)
    if user && user.password == password
       status_success
    else
       unauthorized
    end
  end

end

