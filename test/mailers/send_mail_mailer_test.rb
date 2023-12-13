require "test_helper"

class SendMailMailerTest < ActionMailer::TestCase

  def setup
    @request = requests(:one)
  end

  test "apply_notification" do
    mail = SendMailMailer.apply_notification(@request)
    assert_equal ["example@gmail.com"], mail.to
    assert_equal ["from@example.com"], mail.from
    # assert_match(mail.body.encoded).to include('Thank you for your application.')
    # assert_match "Hi", mail.body.encoded
  end


  test "confirm_notification" do
    mail = SendMailMailer.confirm_notification(@request)
    assert_equal ["example@gmail.com"], mail.to
    assert_equal ["from@example.com"], mail.from  
  end

  test "reject_notification" do
    mail = SendMailMailer.reject_notification(@request)
    assert_equal ["example@gmail.com"], mail.to
    assert_equal ["from@example.com"], mail.from  
  end

end
