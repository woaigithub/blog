require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include FactoryGirl::Syntax::Methods

  def test_should_be_200
    get :new
    assert_response(200)
  end

  def test_should_be_stay_new_template_when_you_submit_invalid_signup_user
    user=FactoryGirl.build(:user_invalid_without_email)
    post :create, user
    
    assert_template :new
    assert_equal "sign up failed!", flash[:notice]
  end

  def test_should_be_successful_when_you_submit_valid_signup_user


    user =FactoryGirl.build(:user_valid)
    post :create, {:user=>{:email=>user.email,:nickname=>user.nickname,
    	                   :password=>user.password,
    	                   :password_confirmation => user.password_confirmation}}
    assert_equal  "sign up successfully!",flash[:notice]
    assert @controller.signed_in?

  end

end
