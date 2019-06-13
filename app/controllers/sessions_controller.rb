class SessionsController < ApplicationController
  def new
  end

  def create
    fail
    user = User.find_by(name: params[:name])
    if user && user.try(:authenticate, params[:password])
      redirect_to welcome_path
    else
      render :new
    end
  end
end
