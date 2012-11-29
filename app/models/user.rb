class User < ActiveRecord::Base
  attr_accessible :email, :nickname

  validates :email, :presence => true, :uniqueness => true
  validates :nickname, :presence => true

  has_many :posts
 
  class << self
    def authenticate(params)
      User.find_by_email(params[:email])
    end
  end
end
