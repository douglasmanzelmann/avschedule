class TasksController < ApplicationController

	def index
		@today = Task.for_today
		@tomorrow = Task.for_tomorrow
	end

	def create
	end

	def new 
	end

	def edit 
	end 

	def show 
	end

	def update
	end

	def destroy
	end
end
