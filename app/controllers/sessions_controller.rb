class SessionsController < ApplicationController

  def new
    @user = User.new
  end
 
  def create
    user = User.authenticate(params[:user])

    if user
      flash[:notice] = "sign in successfully"
      signin(user)
      redirect_to root_path
    else
      flash.now[:notice] = "email and password can't match"
      render :new
    end
  end

  def destroy
    signout
    redirect_to root_path
  end
end
