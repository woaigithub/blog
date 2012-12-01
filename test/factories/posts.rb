FactoryGirl.define do
  factory :post_valid, :class=>:Post do
    title "post title"
    slug "post-title"
    summary "summary"
    content "content"
  end

  factory :post_invalid_without_title, :class=>:Post do

    slug "post-title"
    summary "summary"
    content "content"
  end
 
  factory :post_invalid_without_slug, :class=>:Post do
    title "post title"
    
    summary "summary"
    content "content"
  end

  factory :post_invalid_without_summary, :class=>:Post do
    title "post title"
    slug "post-title"
    
    content "content"
  end

  factory :post_invalid_without_content, :class=>:Post do
    title "post title"
    slug "post-title"
    summary "summary"
    
  end

  factory :post_invalid_title_length_less_than_min, :class=>:Post do
    title "po"
    slug "post-title"
    summary "summary"
    content "content"
  end

  factory :post_invalid_slug_length_less_than_min, :class=>:Post do
    title "posdfsdf"
    slug "pe"
    summary "summary"
    content "content"
  end

  factory :post_invalid_summary_length_more_than_max, :class=>:Post do
    title "posdfsdf"
    slug "pdfe"
    summary "summary"*200
    content "content"
  end



  factory :post_invalid_content_length_more_than_max, :class=>:Post do
    title "posdfsdf"
    slug "pdfe"
    summary "summary"
    content "content"*10000
  end



end