class User < ActiveRecord::Base
  attr_accessible :email


  class << self
    def authenticate(params)
      User.find_by_email(params[:email])
    end
  end
end
