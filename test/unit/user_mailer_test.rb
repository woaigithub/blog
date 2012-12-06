
require 'test_helper'

class UserMailerTest < ActionMailer::TestCase


  tests UserMailer

  test "invite" do
  	from = "woaiguanshui2012@163.com"
  	to = "woaiguanshui2013@163.com"
  	@expected.from = from
  	@expected.to = to
  	@expected.subject = "you have invited by #{@expected.from}"
  	@expected.body = read_fixture('invite')
  	@expected.date = Time.now

  	assert_equal @expected.encoded, UserMailer.create_invite(from, to, @expected.date).encoded
  end
end
