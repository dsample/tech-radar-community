source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'acts_as_tenant'

gem 'json'
gem 'oauth2'
gem 'omniauth'
gem 'omniauth-google-oauth2'

gem 'rdiscount'
gem 'mingle4r'


group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'zurb-foundation'
  gem 'compass'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
#gem 'unicorn'
gem 'thin'
#gem 'puma'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'debugger'

#gem 'rack-ntlm', :git => 'git://github.com/lukefx/rack-ntlm.git'

# Satisfy Heroku and stop it injecting plugins
gem 'rails_12factor'