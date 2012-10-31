class AdminController < ApplicationController
  layout 'admin'

  def index
    respond_to do |format|
      format.html
    
    end
  end
end
