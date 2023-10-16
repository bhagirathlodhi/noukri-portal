require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "login with valid information" do
    get user_session_path
    post user_session_path, params: { session: {email: "user@example.com", encrypted_password: 'password' } }
    assert_redirected_to root_path
    follow_redirect!
    #assert_template 'users/show'
    assert_select "a[href=?]", user_session_path, count: 0
    assert_select "a[href=?]", user_session_path
    #assert_select "a[href=?]", user_path(@user)
  end
end
