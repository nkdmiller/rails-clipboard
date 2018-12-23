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
	    log_in(@user)
	    redirect_to "/welcome/index"
	end
  end

  def creategithub
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.password = SecureRandom.base64(10)
      u.email = "github@login"
    end
    log_in(@user)
 
    redirect_to '/welcome/index'
  end  	
  def delete
  	session.clear
  	redirect_to "/welcome/index"
  end

  private
 
  def auth
    request.env['omniauth.auth']
  end
end
