class SmsNotification < Notification

  validates_format_of :destination, :with => /^(\(\d{3}\)|\d{3})-?\d{3}-?\d{4}$/

  def destination=(destination)
    self[:destination] = destination.gsub(/\D/, '')
  end

  def deliver
    TwilioAccount.sms.messages.create({
      :from => '+13175504935',
      :to   => destination,
      :body => MESSAGE})
  end

end
