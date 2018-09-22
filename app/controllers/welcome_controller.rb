class WelcomeController < ApplicationController
  def index
    if session[:user_id].blank?
      redirect_to "/sessions/new"
    else
      render :index
    end
  end
end
