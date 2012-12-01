require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods 
  # test "the length of title is less than 5" do
  #   category = categories(:two)
  #   assert category.save
  # end


  # test "the length of title is more than 20 " do
  #   category = Category.new(:title => "b"*21)
  #   assert !category.save, "should not save category of title's length is more than 20"
  # end
 
  # test"load category from fixtures" do
  #   category = categories(:one)
  #   assert_equal("ruby", category.title)
  # end

  def test_should_be_valid
    category = FactoryGirl.build(:category_valid)
    assert category.valid?
  end

  def test_should_be_invalid_without_title
    category = FactoryGirl.build(:category_invalid_without_title)
    assert category.invalid?
  end

  def test_should_be_invalid_title_length_equal_21_more_than_max
    category = FactoryGirl.build(:category_invalid_title_length_equal_21)
    assert category.invalid?
  end


end
