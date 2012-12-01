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
end