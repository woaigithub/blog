FactoryGirl.define do
  factory :comment_valid, :class => :Comment do
    commenter "virusswb"
    commenter_email "jorden008@163.com"
    commenter_url "http://virusswb.blog.51cto.com"
    content "a good post"
  end

  factory :comment_invalid_email_format, :class => :Comment do
    commenter "virusswb"
    commenter_email "@163.com"
    commenter_url "http://virusswb.blog.51cto.com"
    content "a good post"
  end

  factory :comment_invalid_url_length_more_than_max, :class => :Comment do
    commenter "virusswb"
    commenter_email "jorden008@163.com"
    commenter_url "http://virusswb.blog.51cto.com"*40
    content "a good post"
  end

  factory :comment_invalid_content_length_more_than_max, :class => :Comment do
    commenter "virusswb"
    commenter_email "jorden008@163.com"
    commenter_url "http://virusswb.blog.51cto.com"
    content "a good post"*400
  end

  factory :comment_invalid_without_content, :class=>:Comment do
    commenter "virusswb"
    commenter_email "jorden008@163.com"
    commenter_url "http://virusswb.blog.51cto.com"
  
  end


  factory :comment_invalid_without_commenter, :class=>:Comment do
    commenter ""
    commenter_email "jorden008@163.com"
    commenter_url "http://virusswb.blog.51cto.com"
    content "a good post"
  end
  
end