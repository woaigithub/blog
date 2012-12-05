require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  include FactoryGirl::Syntax::Methods

  def test_admin_login_and_browse_posts
    user = FactoryGirl.create(:user_valid)
    
    get "/signin"
    assert_response(200)

    post_via_redirect("sessions", {:user=>{:email=> user.email, :password => user.password}})
    assert_equal "/", path
    assert_equal "sign in successfully", flash[:notice]
  end

end
