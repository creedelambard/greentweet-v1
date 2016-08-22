class AppauthController < ApplicationController

  def index
    @@client = TwitterOAuth::Client.new(
        consumer_key:    ENV['twitter_consumer_key'],
        consumer_secret: ENV['twitter_consumer_secret']
    )

    @@request_token = @@client.request_token(oauth_callback: 'http://www.pf2.us:3000/appauth/callback')

    @authorize_url = @@request_token.authorize_url
  end

  def callback
    @access_token = @@client.authorize(
      @@request_token.token,
      @@request_token.secret,
      oauth_verifier: params['oauth_verifier']
    )
    @user_token  = @access_token.token
    @user_secret = @access_token.secret
  end

  def tweet
    @sydney = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_consumer_key']
      config.consumer_secret     = ENV['twitter_consumer_secret']
      config.access_token        = params['tweet']['user_token']
      config.access_token_secret = params['tweet']['user_secret']
    end
  end
end
