ActionMailer::Base.smtp_settings = {
  :address              => "smtp.163.com",
  :port                 => 25,
  :domain               => "163.com",
  :user_name            => "woaiguanshui2012",
  :password             => "123456asdf",
  :authentication       => "plain",
  :enable_starttls_auto => true
}