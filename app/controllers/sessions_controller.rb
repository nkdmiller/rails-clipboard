class SessionsController < ApplicationController
  def new
  	
    if session[:user_id].blank?
      render :layout => false
    else
      redirect_to "/welcome/index"
    end
  end
  def create
    @user = User.find_by(name: params[:user][:name])
    if @user.nil? || !@user.authenticate(params[:user][:password])
    	flash[:notice] = "Username and password not recognized."
    	redirect_to "/sessions/new"
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
