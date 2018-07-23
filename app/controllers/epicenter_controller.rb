class EpicenterController < ApplicationController

  # before_action :authenticate_user!

  def tag_tweets
    @tag = Tag.find(params[:id])
  end

  
  def feed
    @tweet = Tweet.new
  	@following_tweets = []
# If the current user is following the user_id that tweeted, or if the current_user's id is the tweet user ID, it will be displayed (pushed) into the array.
  	Tweet.all.each do |tweet|
  		if current_user.following.include?(tweet.user_id) || current_user.id == tweet.user_id
  		 @following_tweets.push(tweet)
  		end
  	end
  end

  def show_user
    @user = User.find(params[:id])
  end

  def now_following
    # We are adding the user.id of the user you want to
    # follow to your following array.
    # We also want to make sure it's saved in there as an integer.
    current_user.following.push(params[:id].to_i)
    current_user.save

    redirect_to show_user_path(id: params[:id])
  end

  def unfollow
    current_user.following.delete(params[:id].to_i)
    current_user.save

    redirect_to show_user_path(id: params[:id])
  end
end
