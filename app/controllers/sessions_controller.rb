class SessionsController < ApplicationController
  def new
    if session[:user_id].blank?
    	@user = User.new
    else
      redirect_to "/welcome/index"
    end
  end
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.nil? || !@user.authenticate(params[:user][:password])
    	flash.now[:notice] = "Username and password not recognized."
    	render :new
    else
	    session[:user_id] = @user.id
	    redirect_to "/welcome/index"
	end
  end

  def delete
  	session.clear
  	redirect_to "/welcome/index"
  end
end
