class SessionsController < ApplicationController
	protect_from_forgery :except => [:callback]

	def login
		user = current_user
		redirect_to root_url if current_user
	end

  def create
    auth = request.env["omniauth.auth"]
    ident = Identity.find_by_provider_and_uid(auth["provider"], auth["uid"])
    
		# Is the user already logged in?
    if session[:user_id]
      # Yes: Does this identity already exist?
      if ident
        # Yes: Is it for the same user?
        if ident.user.id == current_user.id
          # Yes: Tell them it's already added
					ident.refresh_access_token
          flash['warn'] = "This identity is already linked to your account"
        else
          # No: Tell them it's already assigned to another user
          flash['error'] = "This identity is already assigned to another user. Try logging in with that account and unauthorising"
        end
      else
        # No: Create the identity and link to this user
        ident = Identity.create_with_omniauth(auth)
        current_user.identities << ident
      end
    else
      # No: Does identity already exist?
      if ident
        # Yes: Log user in
				ident.refresh_access_token
        session[:user_id] = ident.user.id
      else
        # No: Create identity, create user and log them in
        ident = Identity.create_with_omniauth(auth)
        user = User.create(:display_name => ident.name)
        user.identities << ident
        session[:user_id] = user.id
        firsttime = true
      end
    end

    #raise request.env["omniauth.auth"].to_yaml
    if session[:return_to]
      redirect_to session[:return_to], :flash => flash
    else
      redirect_to root_url, :flash => flash, :firsttime => firsttime
    end
	end
	
	def destroy
    session[:user_id] = nil
    flash["notice"] = "Signed out"
    redirect_to root_url, :flash => flash
  end
	
end