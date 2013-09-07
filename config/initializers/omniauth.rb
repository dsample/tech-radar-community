module OmniAuth
  class Builder < ::Rack::Builder
    def provider_patch(klass, *args, &block)
      @@providers ||= []

      puts "args: "
      puts args.inspect

      @@providers << { 
      	provider: klass, 
      	name: ( args.present? ? args[2][:name] || klass : klass )
      } if klass != 'developer'

      puts @@providers

      old_provider(klass, *args, &block)
    end
    alias old_provider provider
    alias provider provider_patch
    class << self
      def providers
        @@providers
      end
    end
  end
end

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :developer unless Rails.env.production?

    if ENV['GOOGLE_CLIENT_ID'].present? && ENV['GOOGLE_CLIENT_SECRET'].present?
    	provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
                    :name => "google",
                    :scope => 'userinfo.profile,userinfo.email',
                    :access_type => 'offline',
                    :approval_prompt => ( Rails.env.production? ? 'auto' : 'force' ) # 'auto' / 'force'
    end
end