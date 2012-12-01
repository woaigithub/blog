FactoryGirl.define do
  factory :tag_valid, :class=>:Tag do
    title "tagtitle"
  end

  factory :tag_invalid_without_title, :class=>:Tag do

  end

  factory :tag_invalid_title_length_equal_21,:class=>:Tag do

  	title "a"*21
  end



end