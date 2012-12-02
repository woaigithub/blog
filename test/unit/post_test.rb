require 'test_helper'

class PostTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  def test_should_be_valid
    post=build(:post_valid)
    assert post.valid?
  end

  def test_should_be_valid_with_category1
    post = FactoryGirl.build(:post_valid_with_category1)
    assert post.category.valid?
  end

  def test_should_be_valid_with_category2
    post = FactoryGirl.build(:post_valid_with_category2)
    assert post.category.valid?
  end

  def test_should_be_invalid_post_invalid_without_title
    post=build(:post_invalid_without_title)
    assert post.invalid?
  end

  def test_should_be_invalid_post_invalid_without_slug
    post=build(:post_invalid_without_slug)
    assert post.invalid?
  end

  def test_should_be_invalid_post_invalid_without_summary
    post=build(:post_invalid_without_summary)
    assert post.invalid?
  end

  def test_should_be_invalid_post_invalid_without_content
    post=build(:post_invalid_without_content)
    assert post.invalid?
  end

  def test_should_be_invalid_post_invalid_title_length_less_than_min
    post=build(:post_invalid_title_length_less_than_min)
    assert post.invalid?
  end
  
  def test_should_be_invalid_post_invalid_slug_length_less_than_min
    post=build(:post_invalid_slug_length_less_than_min)
    assert post.invalid?
  end

  def test_should_be_invalid_post_invalid_summary_length_more_than_max
    post=build(:post_invalid_summary_length_more_than_max)
    assert post.invalid?
  end

  def test_should_be_invalid_post_invalid_content_length_more_than_max
    post=build(:post_invalid_content_length_more_than_max)
    assert post.invalid?
  end



end
