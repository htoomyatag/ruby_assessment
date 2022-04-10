require_relative './base_controller.rb'


class PostsController < BaseController

  #TASK 4  
  #http://127.0.0.1:9292/posts/ip_address_list
  def ip_address_list
    @ips = Post.includes(:user).all.pluck(:author_ip, "users.username")
    build_response render_json
  end

 
  #TASK 3
  #http://127.0.0.1:9292/posts/top_post_by_avg_rating
  def top_post_by_avg_rating
     rating = Rating.pluck(:rate)
     average_rating = rating.sum / rating.size
     @top_post_ids = Rating.where(:rate => average_rating).pluck(:post_id)
     @posts = Post.where(:id => @top_post_ids).pluck(:title,:content)
     build_response render_json
  end


  #TASK 1
  #http://127.0.0.1:9292/posts/create_post
  def create_post

    title = params['post']['title']
    content = params['post']['content']
    username = params['post']['username']
    password = params['post']['password']
    ip = @request.ip

    user = User.find_by_username(params['post']['username'])
    if user && user.password == params['post']['password']
        post = Post.create(title: title, user_id: user.id, content: content, author_ip: ip)
    else
        user = User.create(username: username, password: password)
        user.save
        post = Post.create(title: title, user_id: user.id, content: content, author_ip: ip)
    end

    if post.invalid?
          error_validation
    elsif post.save
          status_success
    else
          # failure when saving => status 500
    end
  end


end
