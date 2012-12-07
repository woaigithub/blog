class UserMailer < ActionMailer::Base
  default from: "woaiguanshui2012@163.com"

  def registration_confirmation(user)
  	@user = user
  	attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => user.email, :subject => "Registered")
  end


  def password_reset(user)
    @user = user
    mail(:to => user.email, :subject => "Password Reset")
  end
end
