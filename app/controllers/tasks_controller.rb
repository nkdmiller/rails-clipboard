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
  	@task.filled = params[:filled]
  	@task.save
  	redirect_to "/welcome/index"
  end
  def new
  	@project = Project.find(params[:project_id])
  end
  def create
  	@project.create_project_tasks(params)
    if @project.save
      redirect_to "/welcome/index"
    else
      redirect_to "/projects/<%='#{@project.id}%>"
    end
  end
  def destroy
  	Task.find(params[:id]).destroy
  	redirect_to "/projects/#{params[:project_id]}"
  end

  def pickedup
    @tasks = Task.picked_up
    render :pickedup
  end
end