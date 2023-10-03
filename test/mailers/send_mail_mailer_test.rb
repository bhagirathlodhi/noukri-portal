require "test_helper"

class SendMailMailerTest < ActionMailer::TestCase
  test "apply_notification" do
    mail = SendMailMailer.apply_notification
    assert_equal "Apply notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
