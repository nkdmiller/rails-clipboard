class WelcomeController < ApplicationController
  def index
    if session[:user_id].blank?
      redirect_to "/sessions/new"
    else
    	@user = User.find(current_user.id)
    	@projects = @user.projects
    	@tasks = @user.tasks
      render :index
    end
  end
end
