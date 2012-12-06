class SessionsController < ApplicationController

  def new
    @user = User.new
  end
 
  def create
    user = User.authenticate(params[:user])
    
    debugger

    if user
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = { :value => user.auth_token, :expires => 2.weeks.from_now.localtime }
      end
      flash[:notice] = "sign in successfully"
      signin(user)
      
      redirect_to root_path
    else
      flash.now[:notice] = "email and password do not match"
      render :new
    end
  end

  def destroy
    signout
    cookies.delete(:auth_token)
    redirect_to root_path
  end
end
