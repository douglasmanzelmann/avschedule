class StaticPagesController < ApplicationController

  include ApplicationHelper
  include RoomHelper

  def home
  	@date = params[:date] ? Date.parse(params[:date]) : Date.today
  	@tasks = sort_by_begin_time(Task.for_date(@date).all)
  	@task = Task.new
  end

  def stats
  	@room_list = room_list
    @rooms = []

    @room_list.each do |room|
      room_hash = { }
      room_stats = Task.room_stats(room)
      room_hash[:room] = room
      room_hash[:LCD] = room_stats.gear_stats("LCD").all.length
      room_hash[:Vidcon] = room_stats.gear_stats("Vidcon").all.length
      @rooms << room_hash
    end
  end
end
