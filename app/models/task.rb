class Task < ActiveRecord::Base
  attr_accessible :begin, :day, :end, :gear, :notes, :preset, :room, :setup, :strike
  validates :room, presence: true
  validates :begin, presence: true
  validates :end, presence: true
  validates :gear, presence: true
  validates :day, presence: true

  scope :for_today, lambda { where(day: Date.today) }
  scope :for_tomorrow, lambda { where(day: Date.today.tomorrow) }
  scope :for_date, lambda { |date| where(day: date ) }
end
