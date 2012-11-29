class SessionsController < ApplicationController

  def new

  end
 
  def create
    user = User.authenticate(params[:user])

    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end
  end
end
