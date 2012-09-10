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
			render 'new'
		end
	end

	def edit 
		@task = Task.find(params[:id]) 
	end 

	def show
		@task = Task.find(params[:id]) 
	end

	def update
		@task = Task.find(params[:id])


		if @task.update_attributes(params[:task])
			flash[:success] = "Task Updated"
			redirect_to root_path
		else
			render 'edit'
		end
	end

	def destroy
		@task.destroy
		redirect_to root_path
	end
end
