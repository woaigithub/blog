class Usermailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url = ""
    mail(:to => user.email, :subject => "welcome to my site!")
    
  end
end
