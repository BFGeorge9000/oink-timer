class TwitterNotification < Notification

  validates_format_of :destination, :with => /^[a-zA-Z0-9_]{1,20}$/i

  def self.label
    "Twitter Handle to Receive Alert"
  end

  def self.placeholder
    "YourTwitterName"
  end

  def deliver
    Rails.logger.debug "... Sending Tweet to #{destination}"
    Twitter.update("@#{destination} #{MESSAGE} #BACON #automation")
  end
  handle_asynchronously :deliver,
    :run_at => Proc.new { |notification| notification.timer.duration.seconds.from_now }
end
