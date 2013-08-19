class Identity < ActiveRecord::Base
  belongs_to :user
  attr_accessible :access_token, :avatar_url, :expires, :expires_at, :expires_at_string, :name, :profile_url, :provider, :refresh_token, :token_secret, :uid, :username
end
