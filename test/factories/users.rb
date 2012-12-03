FactoryGirl.define do
  factory :user1, :class => :User do
    nickname "nickname"
    email "ee@123.com"
    password "123"
    password_confirmation "123"
  end
  factory :user2, :class => :User do
    nickname "nickname2"
    email "ee2@123.com"
    password "1232"
    password_confirmation "123"
  end

  sequence :email do |n|
    "email#{n}@factory.com"
  end


  factory :user_invalid_without_email, :class => :User do
    nickname "nickname2"
    password "1232"
    password_confirmation "1232"
  end

  factory :user_valid, :class=>:User  do
  
    email
    nickname "nickname"
    password "123456"
    password_confirmation "123456"
  end
end