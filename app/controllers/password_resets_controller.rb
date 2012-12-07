class PasswordResetsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_url, :notice => "Email sent with password reset instructions."
  end

  def edit
    @user = User.find_by_password_reset_token(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token(params[:id])

    #debugger

    if @user && @user.password_reset_sent_at < 2.hours.ago
         
      redirect_to new_password_reset_path, :notice => "your password reset has expired!"
    elsif @user && @user.reset_password(params[:user][:password])
      redirect_to root_path, :notice => "your password reset successfully"
    else
      render :edit
    end
  end

end
