require 'test_helper'

class Admin::PostsControllerTest < ActionController::TestCase

  include FactoryGirl::Syntax::Methods
  def test_should_create_post_successfully
  	user = FactoryGirl.create(:user_valid)
  	category = FactoryGirl.create(:category_valid)
    #@request.session[:user_id] = user.id
    article = FactoryGirl.build(:post_valid)
    tag = FactoryGirl.build(:tag_valid)
    

    assert_difference('Post.count') do   
      post :create, {:post=>{:category_id=>category.id,
      	                     :title=>article.title,
      	                     :slug=>article.slug,
      	                     :summary=>article.summary,
      	                     :content=>article.content},
      	             :tag_ids => [tag.id]},
      	            {:user_id => user.id}
    end


    assert_redirected_to admin_posts_path(assigns(:posts))

  end



end
