require 'digest'
require 'securerandom'

class User < ActiveRecord::Base
  include Gravtastic
  gravtastic

  attr_accessible :email, :nickname, :password, :password_confirmation
  attr_accessor :password, :password_confirmation
   
  validates :password, :confirmation => true
  validates :password_confirmation, :presence => true
 
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /^\w+@\w+\.\w+$/ },
                    :length => { :maximum => 40 }
  validates :nickname, :presence => true, :length => { :in =>1..30 }

  has_many :posts
 
  before_save :encrypt_password 

  before_create { generate_token(:auth_token) }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def generate_digest(salt,unencrypt_password)
    Digest::SHA256.hexdigest(salt+unencrypt_password)
  end

  class << self
    def authenticate(params)
      user = User.find_by_email(params[:email])
      if user && user.generate_digest(user.password_salt, params[:password]) == user.password_digest
        user
      else
        nil
      end
    end
  end

  private

  def encrypt_password
    self.password_salt = generate_salt
    self.password_digest = generate_digest(self.password_salt,self.password)
  end
  
  def generate_salt
    SecureRandom.hex
  end

  
end
