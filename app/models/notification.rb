class Notification < ActiveRecord::Base
  attr_accessible :destination, :type

  VALID_TYPES = %w(
    SmsNotification
    TwitterNotification
    EmailNotification
  )


  validates_presence_of :destination, :type
  validates_uniqueness_of :type, :scope => :timer_id
  validates_inclusion_of :type, :in => VALID_TYPES
  belongs_to :timer
end
