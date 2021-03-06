class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :signed_in?, :current_user

  
  
  def signin(user, remember_me = nil)
    if remember_me
      cookies.permanent[:auth_token] = user.auth_token
    else
      cookies[:auth_token] = { :value => user.auth_token, :expires => 2.weeks.from_now.localtime }
    end
    session[:user_id] = user.id
    current_user = user
  end

  def signout
    cookies.delete(:auth_token)
    session[:user_id] = nil
    current_user = nil
  end

  def current_user
    #@current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    
  end

  def current_user=(user)
    @current_user = user
  end

  def signed_in?
    !!current_user
  end
end
