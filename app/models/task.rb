class Task < ActiveRecord::Base

  include ApplicationHelper
  attr_accessible :begin, :day, :end, :gear, :notes, :preset, :room, :setup, :strike
  validates :room, presence: true
  validates :begin, presence: true
  validates :end, presence: true
  validates :gear, presence: true
  validates :day, presence: true
  after_create :check_room_schedule

  scope :for_date, lambda { |date| where(day: date) }
  scope :for_room, lambda { |room| where(room: room) }

  scope :room_stats, lambda { |room| where(room: room) }
  scope :gear_stats, lambda { |gear| where(gear: gear) } 

  private

    def check_room_schedule
      @tasks = sort_by_begin_time(Task.for_date(self.day).for_room(self.room))
      if @tasks.length >= 1
        self.notes = "previous or post setup"
      end
    end
end
