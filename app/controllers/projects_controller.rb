class ProjectsController < ApplicationController

  def new
  end

  def create
  	@project = Project.create!(project_params)
  	@task = Task.create!(:project_id => @project.id, :user_id => session[:user_id], :filled => true, :admin => true, :username => User.find(session[:user_id]).name)
  	@project.create_project_tasks(params)
    if @project.save
      redirect_to "/welcome/index"
    else
      redirect_to "/projects/new"
    end

  end

  def addtask
  	@project = Project.find(params[:task][:project_id])
  	task = @project.add_task(task_params, @project)
    if !params[:noredirect]
  	   redirect_to "/projects/#{@project.id}"
    end
    render json: task
  end

  def show
  	@project = Project.find(params[:id])
    @task = Task.new
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @project }
    end
  end

  def index
    @projects = Project.all
    respond_to do |format|
      format.json {render json: @projects.to_json}
    end
  end

  def edit
  end

  def destroy
  	Project.find(params[:id]).tasks.each do |task|
  		task.destroy
  	end
  	Project.find(params[:id]).destroy
  	redirect_to "/welcome/index"
  end

  private
  	def project_params

    	params.require(:project).permit(:name)

  	end

  	def task_params

  		params.require(:task).permit(:role, :details, :number, :project_id)

  	end
end
