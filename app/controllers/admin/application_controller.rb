class Admin::ApplicationController < ApplicationController

  layout "layouts/admin"

  before_filter :require_signin

  def require_signin
    unless signed_in?
      flash[:notice] = "you should sign in first !"
      redirect_to signin_path
    end
  end
end
