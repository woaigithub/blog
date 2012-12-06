
require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  include FactoryGirl::Syntax::Methods

  def test_registration_confirmation

    user = FactoryGirl.create(:user_valid)
    mail = UserMailer.registration_confirmation(user).deliver

    assert !ActionMailer::Base.deliveries.empty?

  	assert_equal [user.email], mail.to
  	
  end
end
