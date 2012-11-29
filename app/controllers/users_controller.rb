class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = "sign up successfully!"
      redirect_to root_path
    else
      flash.now[:notice] = "sign up failed!"
      render :new
    end
  end
end
