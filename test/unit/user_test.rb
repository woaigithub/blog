require 'test_helper'

class UserTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
 
  test "should be valid user" do
     user = User.new(:nickname => "nickname", :email => "jor@123.com", :password => "123", :password_confirmation => "123")
     assert user.valid?, "user should have valid nickname"
  end 
  
  def test_should_be_valid_nickname_length_equal_min_1
    user = User.new(:nickname => "n", :email => "jor@123.com", :password => "123", :password_confirmation => "123")
    assert user.valid?, "use should have valid nickname"
  end
    
  def test_should_be_valid_user_nickname_length_equal_max_30
    user = User.new(:nickname => "m"*30, :email => "jor@123.com", :password => "123", :password_confirmation => "123")
    assert user.valid?, "use should have valid nickname"
  end

  def  test_should_be_invalid_user_without_nickname 
     user = User.new(:email => "jor@123.com", :password => "123", :password_confirmation => "123")
     assert user.invalid?
  end  

  def  test_should_be_invalid_user_nickname_length_equal_31 
    user = User.new(:nickname => "d"*31, :email => "jor@123.com", :password => "123", :password_confirmation => "123")
    assert user.invalid?
  end

  def  test_should_be_invalid_user_nickname_length_more_than_31
    user = User.new(:nickname => "nickname"*5, :email => "jor@123.com", :password => "123", :password_confirmation => "123")
    assert user.invalid?
  end

  

  def test_should_authenticate_with_matching_email_and_password
    user = User.create(:nickname=>"asdf",:email=>"qq@123.com",:password=>"123",:password_confirmation=>"123")
    
    assert User.authenticate({:email=>"qq@123.com",:password=>"123"})
  end


  def test_should_not_authenticate_with_incorrect_password 
    user = User.create(:nickname =>"ddd",:email=>"ww@123.com",:password=>"123",:password_confirmation=>"123")
    assert_nil User.authenticate({:email=>"ww@123.com",:password=>"234"})
  end
 
  def test_should_be_invalid_with_existing_email
    user = User.create(:nickname=>"andy",:email=>"qq@123.com",:password=>"123",:password_confirmation=>"123")
    user2 = User.new(:nickname=>"andy",:email=>"qq@123.com",:password=>"123",:password_confirmation=>"123")
    assert user2.invalid?
  end

  def test_should_be_valid_user_from_factory_girl
    user = build(:user1)
    assert user.valid?
  end

  def test_should_be_invalid_user_from_factory_girl
    user = build(:user2)
    assert user.invalid?
  end

 
  def test_email_should_be_valid_created_from_sequence
    user = FactoryGirl.build(:user_valid)
    assert user.valid?
  end


  def test_email_should_be_valid_created_from_sequence
    email = FactoryGirl.generate(:email)
    assert !email.blank?
  end

  def test_user_create_should_be_valid_created_from_sequence
    email = FactoryGirl.generate(:email)
    user = FactoryGirl.create(:user_invalid_without_email, :email=>email)
   
    assert user.valid?
  end

  def test_user_build_should_be_valid_created_from_sequence
    email = FactoryGirl.generate(:email)
    user = FactoryGirl.build(:user_invalid_without_email, :email=>email)
   
    assert user.valid?
  end

  def test_should_be_valid
    user =FactoryGirl.create(:user_valid)
   
    assert User.authenticate(:email=>user.email,:password=>user.password)
  end
  
end
