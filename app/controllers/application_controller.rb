class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :check_if_user_exist?

  def check_if_user_exist?
    if session[:user_id].present?
      user = User.find(session[:user_id])
      @client ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['TWITTER_KEY']
        config.consumer_secret     = ENV['TWITTER_SECRET']
        config.access_token        = user.token
        config.access_token_secret = user.secret
      end

      @client
    end
  end
end
