class UsersController < ApplicationController

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
    if @user.valid?
      log_in(@user)
      redirect_to "/welcome/index"
    else
    	flash.now[:notice] = "Unable to create account. Please fix errors below and try again."
    	render :new
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
  	if @user.authenticate(params[:user][:old_password])
  		@user.update(user_params)
  		if @user.valid?
		  	@user.save
		  	redirect_to "/welcome/index"
		else
			flash.now[:notice] = "Unable to update account. Please fix errors below and try again."
			render :edit	
		end
	else
		flash.now[:notice] = "Old password incorrect. Please try again."
		render :edit
	end
  end

  private
 
  def user_params

    params.require(:user).permit(:name, :email, :password, :password_confirmation)

  end
end
