# Install dependencies

1. Install Bundler using `gem install bundler`
2. Install Rails and other dependencies `bundle install`

# Start server

1. `foreman start`
2. go to http://localhost:5000

# Heroku installation

1. Install Heroku tools
2. To enable logging in with a Google account, set environment variables for your keys:

    heroku config:set GOOGLE_CLIENT_ID=<client id>
    heroku config:set GOOGLE_CLIENT_SECRET=<client secret>