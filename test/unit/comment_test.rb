require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods 
  

  def test_should_be_valid
    comment = build(:comment_valid)
    assert comment.valid?
  end

  def test_should_be_invalid_comment_invalid_email_format
    comment = build(:comment_invalid_email_format)
    assert comment.invalid?
  end

  def test_should_be_invalid_comment_invalid_url_length_more_than_max
    comment = build(:comment_invalid_url_length_more_than_max)
    assert comment.invalid?
  end

  def test_should_be_invalid_comment_invalid_content_length_more_than_max
    comment = build(:comment_invalid_content_length_more_than_max)
    assert comment.invalid?
  end

  def test_should_be_invalid_comment_invalid_without_content
    comment = build(:comment_invalid_without_content)
    assert comment.invalid?
  end

  def test_should_be_invalid_comment_invalid_without_commenter
    comment = build(:comment_invalid_without_commenter)
    assert comment.invalid?
  end
  

end
