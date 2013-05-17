class Notification < ActiveRecord::Base
  attr_accessible :destination, :type
  validates_presence_of :destination, :type
  validates_uniqueness_of :type, :scope => :timer_id
  belongs_to :timer
end
