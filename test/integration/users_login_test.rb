require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "login with valid information" do
    get user_session
    assert_template 'sessions/new'
    post user_session, params: { session: { email: "abhi@gmail.com", password: "123456" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
