class UserMailer < ActionMailer::Base
  default from: "woaiguanshui2012@163.com"

  def registration_confirmation(user)
  	@user = user
  	attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => user.email, :subject => "Registered")
  end
end
