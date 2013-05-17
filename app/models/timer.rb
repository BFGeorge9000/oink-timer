class Timer < ActiveRecord::Base
  attr_accessible :duration, :name

  MAX_DURATION = 30.minutes

  validates_numericality_of :duration, :greater_than => 0, :less_than_or_equal_to => MAX_DURATION
  validates_presence_of :name, :duration

  scope :active, where("(created_at + (duration * interval '1 second')) > ?", Time.now)

  def remaining_duration
    remaining = (duration - (Time.now - created_at)).to_i
    remaining >= 0 ? remaining : 0
  end
end
