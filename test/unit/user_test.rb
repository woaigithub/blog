require 'test_helper'

class UserTest < ActiveSupport::TestCase
 
  test "email invalid" do
    user = users(:one)
    assert user.invalid?, "email invalid"
  end 

  test "email invalid two" do
    user=users(:two)
    assert user.invalid?
  end
 
  test "password do not match" do
    user =users(:three)
    assert user.invalid?
  end

  test "all fields are valid" do
    user=User.new(:nickname=>"nickname",:email=>"sdf@13123.xo",
                  :password=>"123456",
                  :password_confirmation=>"123456")
    assert user.valid?
  end

  test "password and password_confirmation do not match" do
    user = User.new(:nickname=>"asdf",:email=>"asdfasdf",:password=>"123",
                                      :password_confirmation=>"234")
    assert user.invalid?
  end

end
