class TasksController < ApplicationController
	before_filter :authenticate_user!

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
		@task.day = @task.day.strftime("%A, %B %d, %Y")
		@task.begin = @task.begin.strftime("%I:%M%P") 
		@task.end = @task.end.strftime("%I:%M%P")
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
		@task = Task.find(params[:id])

		@task.destroy
		flash[:notice] = "Task deleted."
		redirect_to root_path
	end
end
