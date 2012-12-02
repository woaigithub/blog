FactoryGirl.define  do


  factory :category_valid, :class=>:Category do
  	title "categorytitle"
  end

  factory :category_invalid_without_title, :class=>:Category do
  end

  factory :category_invalid_title_length_equal_21, :class=> :Category do
    title "a"*21
  end

  factory :category do
    title "title_category"

  end
end