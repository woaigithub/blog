require 'test_helper'

class Admin::TagsControllerTest < ActionController::TestCase
  include FactoryGirl::Syntax::Methods

  setup :init

  teardown do
    @user_valid = nil

  end

  def test_should_create_tag_successfully
  

    tag = build(:tag_valid)

    assert_difference "Tag.count" do 
      post :create, {:tag => { :title => tag.title}}
    end
  end

  def test_should_create_tag_fail
   

    assert_no_difference "Tag.count" do 
      post :create, {:tag => { :title => ""}}
    end
  end

  private 
  def init
    @user_valid = create(:user_valid)
    @request.session[:user_id] = @user_valid.id
  end
end