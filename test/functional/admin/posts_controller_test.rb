require 'test_helper'

class Admin::PostsControllerTest < ActionController::TestCase

  include FactoryGirl::Syntax::Methods
 
  def setup
    @user_valid = FactoryGirl.create(:user_valid)
    @request.session[:user_id] = @user_valid.id
  end


  def test_should_create_post_successfully

  	category = FactoryGirl.create(:category_valid)

    article = FactoryGirl.build(:post_valid)
    tag = FactoryGirl.build(:tag_valid)
    

    assert_difference('Post.count') do   
      post :create, {:post=>{:category_id=>category.id,
      	                     :title=>article.title,
      	                     :slug=>article.slug,
      	                     :summary=>article.summary,
      	                     :content=>article.content},
      	             :tag_ids => [tag.id]}
    end


    assert_redirected_to admin_posts_path(assigns(:posts))

  end

  def test_route_posts_id

    category = FactoryGirl.create(:category_valid)

    article = FactoryGirl.create(:post_valid)
    
    assert_routing("posts/#{article.id}", {:controller =>  "posts", :action => "show", :id => article.id.to_s })


  end



end
