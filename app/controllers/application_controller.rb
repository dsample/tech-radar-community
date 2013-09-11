
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :logged_in?
  helper_method :authenticate_user!

  private
  
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def logged_in?
		current_user.present?
	end
		
	def authenticate_user!
    if !current_user
      redirect_to login_url
    else
      true
    end
  end

end
