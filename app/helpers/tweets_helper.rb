module TweetsHelper
	def get_tagged(tweet)
		message_arr = tweet.message.split

        message_arr.each_with_index do |word, index|
          if word[0] == "#"
            if Tag.pluck(:phrase).include?(word)
              #save that Tag as a variable (to use in TweetTag creation)
              tag = Tag.find_by(phrase: word)
            else
            #creates a new instance of a Tag
              tag = Tag.create(phrase: word)
            end
            tweet_tag = TweetTag.create(tweet_id: tweet.id, tag_id: tag.id)
            message_arr[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>"
          end          
        end

        tweet.update(message: message_arr.join(" "))
        return tweet
	end
end
