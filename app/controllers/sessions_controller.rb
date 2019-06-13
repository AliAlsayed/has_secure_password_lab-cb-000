class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to welcome_path
    else
      redirect_to welcome_path
      render :new
    end
  end
end
