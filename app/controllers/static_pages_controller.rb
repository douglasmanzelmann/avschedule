class StaticPagesController < ApplicationController
  def home
  	@tasks = Task.for_today.all
  	@task = Task.new
  end
end
