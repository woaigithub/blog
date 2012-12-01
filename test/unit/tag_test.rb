require 'test_helper'


class TagTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  def test_should_be_valid_tag
    tag = FactoryGirl.build(:tag_valid)
    assert tag.valid?
  end

  def test_should_be_invalid_tag_without_title
    tag = FactoryGirl.build(:tag_invalid_without_title)
    assert tag.invalid?
  end

  def test_should_be_invalid_tag_length_equal_21_more_than_max
    tag = FactoryGirl.build(:tag_invalid_title_length_equal_21)
    assert tag.invalid?
  end

end
