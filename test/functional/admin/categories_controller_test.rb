require 'test_helper'

class Admin::CategoriesControllerTest < ActionController::TestCase
  include FactoryGirl::Syntax::Methods

  def test_should_create_category_successfully

    user = FactoryGirl.create(:user_valid)
    @request.session[:user_id] = user.id

    category1 = build(:category_valid)
    category1.title = FactoryGirl.generate(:category_title)

    category2 = build(:category_valid)
    category2.title = FactoryGirl.generate(:category_title)

    assert_difference "Category.count", 2 do
      post :create, {:category => {:title => category1.title}}
      post :create, {:category => {:title => category2.title}}

    end
  end
end
