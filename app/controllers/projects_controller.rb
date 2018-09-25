class ProjectsController < ApplicationController
  def new
  end

  def create
  	@project = Project.create!(project_params)
  	@task = Task.create!(:project_id => @project.id, :user_id => session[:user_id], :admin => true)
  	@project.create_project_tasks(params)
    if @project.save
      redirect_to "/welcome/index"
    else
      redirect_to "/users/new"
    end

  end

  def show
  end

  def index
  end

  def edit
  end

  private
  	def project_params

    	params.require(:project).permit(:name)

  	end
end
