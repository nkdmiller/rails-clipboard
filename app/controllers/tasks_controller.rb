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
    @task.username = @user.name
  	@task.filled = params[:filled]
  	@task.save
  	redirect_to "/welcome/index"
  end
  def index
    @alltasks = Task.all
    @tasks = []
    @alltasks.each do |task|
      if task.user_id == current_user.id && task.filled == true && task.admin == false
        @tasks << task
      end
    end

    render json: @tasks.to_json
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