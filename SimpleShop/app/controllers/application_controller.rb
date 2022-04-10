class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session
  #protect_from_forgery with: :exception
  #skip_before_action :verify_authenticity_token
  before_action :current_cart


  def is_admins?

        if current_user.admin == true
             return true
        else
            render json: { message: "No access right to perform this action."}, status: :unauthorized
            return false
        end
  end

  
  def current_cart
      if session[:cart_id]
        cart = Api::V1::Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id] == nil
        @current_cart = Api::V1::Cart.create
        session[:cart_id] = @current_cart.id
      end
  end






end
