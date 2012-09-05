class Task < ActiveRecord::Base
  attr_accessible :begin, :day, :end, :gear, :notes, :preset, :room, :setup, :strike
end
