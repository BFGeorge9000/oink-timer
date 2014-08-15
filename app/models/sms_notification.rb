class SmsNotification < Notification

  validates_format_of :destination, :with => /^(\(\d{3}\)|\d{3})-?\d{3}-?\d{4}$/

  def destination=(destination)
    self[:destination] = destination.gsub(/\D/, '')
  end
  
  def self.label
    "Phone Number for SMS Notification"
  end

  def self.placeholder
    "3175551234"
  end

  def deliver
    Rails.logger.debug "... Sending SMS to #{destination}"
    TwilioAccount.sms.messages.create({
      :from => '+13175504935',
      :to   => destination,
      :body => MESSAGE})
  end
  handle_asynchronously :deliver,
    :run_at => Proc.new { |notification| notification.timer.duration.seconds.from_now }
end
