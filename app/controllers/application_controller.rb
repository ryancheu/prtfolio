class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include ApplicationHelper

  private
    # redirect to signin if the user is not signed in
    def require_login
      unless signed_in?
        store_location
        flash[:danger] = "You must be logged in to access this page"
        redirect_to root_url
      end
    end
    
    def require_correct_user user, msg
      unless current_user == user
        flash[:danger] = msg
        redirect_to root_path
      end
    end
end
