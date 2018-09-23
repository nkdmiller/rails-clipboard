class ProjectsController < ApplicationController
  def new
  end

  def create

  	puts params
    if @user.save
      session[:user_id] = @user.id
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
  	def user_params

    	params.require(:user).permit(:name)

  	end
end
