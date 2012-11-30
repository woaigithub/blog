require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "the length of title is less than 5" do
    category = categories(:two)
    assert category.save
  end


  test "the length of title is more than 20 " do
    category = Category.new(:title => "b"*21)
    assert !category.save, "should not save category of title's length is more than 20"
  end
 
  test"load category from fixtures" do
    category = categories(:one)
    assert_equal("ruby", category.title)
  end
end
