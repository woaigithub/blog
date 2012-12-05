require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  include FactoryGirl::Syntax::Methods

  def test_admin_login_and_browse_posts
    user = FactoryGirl.create(:user_valid)
    guest = FactoryGirl.create(:user_valid_too)
 
    user_session = signin(user)
    guest_session = signin(guest)

    assert_equal("sign in successfully", user_session.flash[:notice])
    assert_equal("sign in successfully", guest_session.flash[:notice])

    user_session.browse_site
    guest_session.browse_site
  
  end

  def test_should_signin_first_before_add_post
    get "/admin/posts/new"
    follow_redirect!
  end

  private

  module CustomDSL
    def browse_site
      get "admin/posts"
      assert_response(200)
      assert assigns(:posts)
    end
  end

  def signin(user)
  	open_session do |sess|
      sess.extend(CustomDSL)
      sess.post_via_redirect("sessions", {:user => {:email => user.email, :password => user.password}})
      
    end
  end

end
