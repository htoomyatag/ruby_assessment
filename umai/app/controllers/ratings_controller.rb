require_relative './base_controller.rb'

class RatingsController < BaseController


  #TASK 2 
  #http://127.0.0.1:9292/ratings/create_rating
  def create_rating
 
    post = params['rating']['post_id']
    rate = params['rating']['rate']
    #create rating by POST ID and RATE 1 to 5
    rating = Rating.create(post_id: post, rate: rate)
  
    if rating.invalid? #if enter more than 5
          error_validation
    elsif rating.save
          post_rates = Rating.where(:post_id => post).pluck(:rate)
          #average rating calculation
          @average_rating = post_rates.sum / post_rates.size 
    else
          # failure when saving => status 500
    end
     #return average rating number
    return_rating average_rating

  end

  def return_rating(body, status: 200)
    [status, { "Content-Type" => "text/html" }, [body]]
  end


   def average_rating
      "average rating is #{@average_rating}"
  end





end

