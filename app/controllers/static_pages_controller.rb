class StaticPagesController < ApplicationController
  def home
  	@today = Task.for_today.first.room
  	@tomorrow = Task.for_tomorrow.first.room 
  end
end
