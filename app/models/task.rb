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
    @conflicting_tasks = Task.for_date(self.day).for_room(self.room)

    @conflicting_tasks.each do |task|
      if self.begin < task.begin
        self.notes = "There is another meeting in this room at #{task.begin.strftime("%I:%M%P")}."
      elsif self.begin > task.begin 
        task.notes = "There is another meeting in this room at #{self.begin.strftime("%I:%M%P")}"
        task.save
      end
    end

  end

  private

    def self.list_in_asc_order
      order('begin asc')
    end
end