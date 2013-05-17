class Timer < ActiveRecord::Base
  attr_accessible :duration, :name

  validates_numericality_of :duration, :greater_than => 0
  validates_presence_of :name, :duration

end
