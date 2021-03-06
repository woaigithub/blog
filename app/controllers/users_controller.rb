class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      UserMailer.registration_confirmation(@user).deliver

      flash[:notice] = "sign up successfully!"
      signin(@user)
      redirect_to root_path
    else
      flash.now[:notice] = "sign up failed!"
      render :new
    end
  end
end
