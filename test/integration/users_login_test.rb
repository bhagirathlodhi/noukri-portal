require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "login with valid information" do
    get user_session_path
    assert_equal 200, status
    post user_session_path, params: { session: {email: "michael@example.com", password: 'password123' } }
    assert_equal 200, status
    assert_select "a[href=?]", user_session_path, count: 0
    assert_select "a[href=?]", user_session_path
    assert_select "a[href=?]", user_path(@user)
  end

  # test "valid user login" do
  #   user = users(:user) # Fetch the test user from the fixture
  #   assert user.valid_password?('password') # Assuming you're using BCrypt for password hashing
  # end

  # test "invalid user login" do
  #   user = users(:user)
  #   assert_not user.valid_password?('wrong_password')
  # end
end
