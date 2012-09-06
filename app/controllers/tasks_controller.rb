class TasksController < ApplicationController

	def index
		@tasks = Task.all
	end

	def new
		@task = Task.new 
	end

	def create
		@task = Task.new(params[:task])
		if @task.save
			flash[:success] = "New Task added!"
			redirect_to root_path
		else 
			render action: 'new'
		end
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
