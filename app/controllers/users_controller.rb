class UsersController < ApplicationController
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
  end

  private
 
  def user_params

    params.require(:user).permit(:name, :email, :password, :password_confirmation)

  end
end
