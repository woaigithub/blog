require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  include FactoryGirl::Syntax::Methods 
  def test_should_be_get_new
    get :new
    assert_response :success
    assert_not_nil assigns(@user)
  end

  def test_should_be_get_new_status_code
    get :new
    assert_response :success
    assert_not_nil assigns(:user)
  end

  
end
