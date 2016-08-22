json.extract! proposed_tweet, :id, :user_id, :description, :hashtags, :created_at, :updated_at
json.url proposed_tweet_url(proposed_tweet, format: :json)