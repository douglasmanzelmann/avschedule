class Task < ActiveRecord::Base
  include ApplicationHelper
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

    #### 1) queries the DB for tasks on the same day and in the same room as the soon-to-be added task. ####
    #### will soon add equipment, too. ####
    #### loads the tasks in an array, @room_tasks. ####
    #### 2) checks to see if self is the first task in the room on the day, updates the notes attrib
    #### 3) also if it's the first task, check the previous day, and update the last task if 
    #### there is one.
    #### 4) checks to see if it's the last task,and updates prevoius notes attrib
    #### 5) if it's sandwiched, update the previous and self

    @room_tasks = Task.for_date(self.day).for_room(self.room).list_in_asc_order
    @room_tasks << self
    @room_tasks = sort_by_begin_time(@room_tasks)
    @self_position = @room_tasks.index(self)

    if @room_tasks.length >= 1
      if @self_position == 0 #### Self is the first element in the array ####
        if @room_tasks.length > 1
          self.notes = "There is another meeting in this room at #{@room_tasks[@self_position+1].begin.strftime("%I:%M%P")}."
        end

        @last_room_task_yesterday = Task.for_date(self.day.yesterday).for_room(self.room).list_in_asc_order.last
        if @last_room_task_yesterday
          @last_room_task_yesterday.update_attributes(notes: 
            "There is another meeting in this room tomorrow at #{self.begin.strftime("%I:%M%P")}.")
        end    
      elsif @self_position == @room_tasks.length-1 #### Self is the last element in the array ####
        @room_tasks[@self_position-1].update_attributes(
            notes: "There is another meeting in this room at #{self.begin.strftime("%I:%M%P")}.")
      else
        @room_tasks[@self_position-1].update_attributes(
          notes: "There is another meeting in this room at #{self.begin.strftime("%I:%M%P")}.")
        self.notes = "There is another meeting in this room at #{@room_tasks[@self_position+1].begin.strftime("%I:%M%P")}."
      end
    end
  end

  private

    def self.list_in_asc_order
      order('begin asc')
    end
end