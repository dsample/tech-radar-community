class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :logged_in?
  helper_method :authenticate_user!
  helper_method :provider_name
  
  private
  
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def logged_in?
		current_user.present?
	end
	
	def provider_name(provider)
		case provider
			when "google_oauth2"
				"Google"
			when "twitter"
				"Twitter"
			when "facebook"
				"Facebook"
			when "linkedin"
				"LinkedIn"
			when "developer"
				"Developer"
			else
				"Unknown"
		end
	end
	
	def authenticate_user!
    if !current_user
      redirect_to login_url
    else
      true
    end
  end

end
