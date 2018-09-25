class UsersController < ApplicationController
	include ApplicationHelper
  def new
  	render :layout => false
  end

  def create
  	@user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/welcome/index"
    else
      redirect_to "/users/new"
    end
  end
  def edit
  	@user = User.find(params[:id])
	if access?(params[:id])
		render :edit
	else
		redirect_to "/welcome/index"
	end
  end

  def update
  	@user = User.find(params[:id])
  	@user = User.update(user_params)
  	redirect_to "/welcome/index"
  private
 
  def project_params

    params.require(:project).permit(:name, :email, :password, :password_confirmation)

  end
end
