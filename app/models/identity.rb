class Identity < ActiveRecord::Base
  belongs_to :user
  attr_accessible :access_token, :avatar_url, :expires, :expires_at, :expires_at_string, :name, :profile_url, :provider, :refresh_token, :token_secret, :uid, :username

  def self.create_with_omniauth(auth)
    create! do |identity|
      identity.uid = auth["uid"]
      case auth["provider"]
        when "google" #, "google", "google_full"
          identity.provider = "google"
          identity.name = auth["info"]["name"]
          identity.username = auth["info"]["email"]
          identity.access_token = auth["credentials"]["token"]
          if auth["credentials"]["refresh_token"].present?
              identity.refresh_token = auth["credentials"]["refresh_token"]
          end
          identity.expires = auth["credentials"]["expires"]
          identity.expires_at_string = auth["credentials"]["expires_at"]
          #identity.expires_at = auth["credentials"]["expires_at"].to_i
          identity.avatar_url = auth["info"]["image"]
          identity.profile_url = auth["extra"]["raw_info"]["link"]
        when "twitter", "twitter_full"
          identity.provider = "twitter"
          identity.name = auth["info"]["name"]
          #raise auth["extra"]["access_token"].response["header"].to_yaml
          identity.username = auth["info"]["nickname"]
          identity.access_token = auth["credentials"]["token"]
          identity.token_secret = auth["credentials"]["secret"]
          identity.expires = false
          identity.avatar_url = auth["info"]["image"]
          identity.profile_url = auth["info"]["urls"]["Twitter"]
        when "facebook"
          identity.provider = "facebook"
          identity.name = auth["info"]["name"]
          identity.username = auth["info"]["nickname"]
          identity.access_token = auth["credentials"]["token"]
          identity.refresh_token = auth["credentials"]["refresh_token"]
          identity.expires = false
          identity.avatar_url = auth["info"]["image"]
          identity.profile_url = auth["info"]["urls"]["Facebook"]
        when "developer"
        	identity.provider = "developer"
        	identity.name = auth["info"]["name"]
        	identity.username = auth["info"]["email"]
        else
          raise auth.to_yaml
      end
    end
  end


	def refresh_access_token
		case self.provider
			when "google"
				if Time.at(self.expires_at_string.to_i) < DateTime.now
					## http://stackoverflow.com/questions/12572723/rails-google-client-api-unable-to-exchange-a-refresh-token-for-access-token
					client = OAuth2::Client.new ENV['GOOGLE_CLIENT_ID'], 
																			ENV['GOOGLE_CLIENT_SECRET'],
																			{
																				:site => 'https://accounts.google.com',
																				:authorize_url => "/o/oauth2/auth",
																				:token_url => "/o/oauth2/token"
																			}
																
					response = OAuth2::AccessToken.from_hash(client, :refresh_token => self.refresh_token).refresh!

					self.access_token = response.token
					self.expires_at_string = response.expires_at
					self.save
					# FIXME
					
					# raise response.to_yaml
					
					#self.update_attribute(:expires_at_time, Time.at(response.expires_at))
					#self.save
				end
		end
	end
  
end