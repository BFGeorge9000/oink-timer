class Notification < ActiveRecord::Base
  attr_accessible :destination, :type

  validates_presence_of :destination
end
