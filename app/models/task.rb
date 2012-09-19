class Task < ActiveRecord::Base
  attr_accessible :begin, :day, :end, :gear, :notes, :preset, :room, :setup, :strike
  validates :room, presence: true
  validates :begin, presence: true
  validates :end, presence: true
  validates :gear, presence: true
  validates :day, presence: true

  scope :for_date, lambda { |date| where(day: date ) }
  scope :room_stats, lambda { |room| where(room: room) }

  protected
end
