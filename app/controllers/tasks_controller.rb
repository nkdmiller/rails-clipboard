class TasksController < ApplicationController
  def edit
  	@task = Task.find(params[:id])
  	@project = @task.project
  	render :edit 
  end
  def register
  	@task = Task.find(params[:task_id])
  	@user = User.find(params[:user_id])
  	@task.user = @user
  	@task.filled = true
  	@task.save
  	redirect_to "/welcome/index"
  end
end