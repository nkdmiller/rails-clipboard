class WelcomeController < ApplicationController
  def index
    if session[:user_id].blank?
      redirect_to "/sessions/new"
    else
    	@user = User.find(session[:user_id]) #Implement current_user 
    	@admin_tasks = Task.all.created(session[:user_id])
    	@projects = @admin_tasks.map { |task| task.project}
    	@tasks = @user.tasks
      render :index
    end
  end
end
