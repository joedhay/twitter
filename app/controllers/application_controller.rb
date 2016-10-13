class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :check_if_user_exist?

  def check_if_user_exist?
    if session[:user_id].present?
      user = User.find(session[:user_id])
      @client ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = "sLSrDBSnlxBGhz0j7tWhVIeex"
        config.consumer_secret     = "Bx6d74gw73U3SapPGvp4Ih5eaG8qHrKAh8vNar3v3bi9Hd3B4A"
        config.access_token        = user.token
        config.access_token_secret = user.secret
      end

      @client

      puts "CLIENT:#{@client.inspect}"
    end
  end
end
