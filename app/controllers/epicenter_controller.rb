class EpicenterController < ApplicationController
  def feed
  	@following_tweets = []
# If the current user is following the user_id that tweeted, or if the current_user's id is the tweet user ID, it will be displayed (pushed) into the array.
  	Tweet.all.each do |tweet|
  		if current_user.following.include?(tweet.user_id) || current_user.id == tweet.user_id
  			@following_tweets.push(tweet)
  		end
  	end
  end

  def show_user
  end

  def now_following
  end

  def unfollow
  end
end
