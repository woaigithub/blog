require 'digest'
require 'securerandom'

class User < ActiveRecord::Base
  attr_accessible :email, :nickname, :password, :password_confirmation
  attr_accessor :password, :password_confirmation
   
  validates :password, :confirmation => true
  validates :password_confirmation, :presence => true
 
  validates :email, :presence => true, :uniqueness => true
  validates :nickname, :presence => true

  has_many :posts
 
  before_save :encrypt_password 

  def generate_digest(salt,unencrypt_password)
    Digest::SHA256.hexdigest(salt+unencrypt_password)
  end

  class << self
    def authenticate(params)
      user = User.find_by_email(params[:email])
      if user && user.generate_digest(user.salt, params[:password]) == user.password_digest
        user
      else
        false
      end
    end
  end

  private

  def encrypt_password
    self.salt = generate_salt
    self.password_digest = generate_digest(self.salt,self.password)
  end
  
  def generate_salt
    SecureRandom.hex
  end

  
end
