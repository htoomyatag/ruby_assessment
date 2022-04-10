require_relative './base_controller.rb'

class FeedbacksController < BaseController


  #TASK 5
  #http://127.0.0.1:9292/feedbacks/add_feedback
  def add_feedback

    user =  params['feedback']['user_id']  
    post =  params['feedback']['post_id']  
    owner = params['feedback']['owner_id'] 
    comment = params['feedback']['owner_comment']  
     
    feedback = Feedback.create(user_id: user, post_id: post,owner_id:owner,owner_comment:comment)
 
    if feedback.invalid?
          if user == ''
              @feedbacks = Feedback.where(:post_id => post).pluck(:owner_comment)
          elsif post == ''
              @feedbacks = Feedback.where(:user_id => user).pluck(:owner_comment)
          else
          end
          build_response render_json
    else 
          feedback.save
          status_success
    end
    
  end

end

