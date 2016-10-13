class TwitterController < ApplicationController

  def index
    if session[:user_id].present?
      @user = User.find(session[:user_id])
      id = (@user.uid).to_i
      @tweets = @client.user_timeline(id)
    else
      redirect_to(root_url)
    end

  end

  def logout
    session[:user_id] = nil
    redirect_to(root_url)
  end

  def post_tweet
    #tweet = User.twitter(session[:user_id])
    user = User.find(session[:user_id])
    message = params[:message]

    @client.update(message)
    id = (user.uid).to_i
    @tweets = @client.user_timeline(id)
    @data = render :partial => 'twitter/list_of_tweets'
  end
end