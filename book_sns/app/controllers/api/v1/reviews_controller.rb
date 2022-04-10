class Api::V1::ReviewsController < ApplicationController

  before_action :authorize_request
  before_action :following_user_review, only: %i[ search_review ]
 
  # GET /api/v1/search_review?keyword=test_data
  def search_review   
    keyword_compose(params[:keyword])
    results = @reviews.search_by_input(@keyword) if params[:keyword].present?
    return not_found unless !results.empty? 
    render :json => results
  end

  # prepare keyword data for title,description and following user
  def keyword_compose(data)
    @user_id = User.where(:user_name => data).pluck(:id)
    if @user_id.present?
      @keyword = @user_id.join
    else
      @keyword = data
    end
  end

  private

  # reviews posted by following user
  def following_user_review
    @reviews = Review.filter_by_following_user(@current_user.following)
  end

  def not_found
    render json: { message: 'not found' }, status: :not_found       
  end   

end



