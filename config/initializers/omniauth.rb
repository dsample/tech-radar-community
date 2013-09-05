Rails.application.config.middleware.use OmniAuth::Builder do
	provider :developer unless Rails.env.production?

        if ENV['GOOGLE_CLIENT_ID'] && ENV['GOOGLE_CLIENT_SECRET']
        	provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
                        :name => "google",
                        :scope => 'userinfo.profile,userinfo.email',
                        :access_type => 'offline',
                        :approval_prompt => ( Rails.env.production? ? 'auto' : 'force' ) # 'auto' / 'force'
        end
end