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
    
    assert_response(200) 
    assert_not_nil assigns(:user)
  end

  
  def test_should_route_from_signout_to_destroy
    

      assert_routing(
     	            {:path =>"signout", :method => :delete} ,
     	            {:controller =>"sessions", :action =>"destroy", :method => :delete}
     	            )
  
  end
  
  def test_should_be_render_new_template_after_email_do_not_match_password
    post :create,{:user=>{:email=>"",:password=>""}}
    assert_template :new
    assert_equal("email and password do not match" , flash[:notice] )
  end

  def test_should_be_200_after_signin_success
  	user = FactoryGirl.create(:user_valid)
 
  	post :create ,{:user=> {:email=>user.email,:password=>user.password}}
  
  	assert_equal("sign in successfully" , flash[:notice]  )
  	assert_not_nil @controller.current_user
  	assert @controller.signed_in?

  end

end
