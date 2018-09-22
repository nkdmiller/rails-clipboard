class SessionsController < ApplicationController
  def new
    if session[:user_id].blank?
      render :new
    else
      redirect_to "/welcome/index"
    end
  end
  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect_to "/welcome/index"
  end
end
