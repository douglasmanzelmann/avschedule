class StaticPagesController < ApplicationController

  include ApplicationHelper
  include RoomHelper

  def home
  	@date = params[:date] ? Date.parse(params[:date]) : Date.today
  	@tasks = sort_by_begin_time(Task.for_date(@date).all)
  	@task = Task.new
  end

  def stats
  	@rooms = rooms
  end
end
