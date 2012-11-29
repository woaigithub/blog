class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :signed_in?, :current_user

  
  
  def signin(user)
    session[:user_id] = user.id
    current_user = user
  end

  def signout
    session[:user_id] = nil
    current_user = nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    @current_user = user
  end

  def signed_in?
    !!current_user
  end
end
