twilio_credentials = YAML.load_file("#{::Rails.root.to_s}/config/twilio.yml")
twilio_client = Twilio::REST::Client.new twilio_credentials['account_sid'], twilio_credentials['auth_token']
TwilioAccount = twilio_client.account