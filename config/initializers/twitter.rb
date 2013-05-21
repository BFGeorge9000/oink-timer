twitter_credentials = YAML.load_file("#{::Rails.root.to_s}/config/twitter.yml")

Twitter.configure do |config|
  config.consumer_key = twitter_credentials['consumer_key']
  config.consumer_secret = twitter_credentials['consumer_secret']
  config.oauth_token = twitter_credentials['oauth_token']
  config.oauth_token_secret = twitter_credentials['oauth_token_secret']
end