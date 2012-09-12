class StaticPagesController < ApplicationController
  def home
  	@date = params[:date] ? Date.parse(params[:date]) : Date.today
  	@tasks = Task.for_date(@date).all
  	@task = Task.new
  end

  def next
  	@tasks = Task.for_tomorrow.all
  	@task = Task.new
  end
end
