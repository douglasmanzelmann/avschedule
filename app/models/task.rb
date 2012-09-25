class Task < ActiveRecord::Base
  attr_accessible :begin, :day, :end, :gear, :notes, :preset, :room, :setup, :strike
  validates :room, presence: true
  validates :begin, presence: true
  validates :end, presence: true
  validates :gear, presence: true
  validates :day, presence: true
  before_create :check_room_schedule

  scope :for_date, lambda { |date| where(day: date) }
  scope :for_room, lambda { |room| where(room: room) }

  scope :room_stats, lambda { |room| where(room: room) }
  scope :gear_stats, lambda { |gear| where(gear: gear) } 

  def check_room_schedule
    @conflicting_tasks = Task.for_date(self.day).for_room(self.room).list_in_asc_order

    @conflicting_tasks.each_with_index do |task, index|
      if self.begin < task.begin
        self.notes = "There is another meeting in this room at #{task.begin.strftime("%I:%M%P")}."
        break
      elsif (self.begin > task.begin)
        if ((index == @conflicting_tasks.length-1) || task.begin > @conflicting_tasks[index + 1].begin)
          task.update_attributes(notes: "There is another meeting in this room at #{self.begin.strftime("%I:%M%P")}")
        end
      end
    end

  end

  private

    def self.list_in_asc_order
      order('begin asc')
    end
end