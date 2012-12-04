require 'test_helper'

class Admin::TagsControllerTest < ActionController::TestCase
  include FactoryGirl::Syntax::Methods

  def test_should_create_tag_successfully
    user = create(:user_valid)
    @request.session[:user_id] = user.id 

    tag = build(:tag_valid)

    assert_difference "Tag.count" do 
      post :create, {:tag => { :title => tag.title}}
    end
  end

  def test_should_create_tag_fail
    user = create(:user_valid)
    @request.session[:user_id] = user.id 

    assert_no_difference "Tag.count" do 
      post :create, {:tag => { :title => ""}}
    end
  end
end