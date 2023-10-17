require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "sign up with valid information" do
    get new_user_registration_path
    user = User.new(
      name: 'Bharat',
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password'
    )
    assert user.valid?, 'User should be valid'
    
  end


  test "valid user login" do
    user = users(:michael) 
    assert user.valid_password?('password123') 
  end

  test "invalid user login" do
    user = users(:michael) 
    assert_not user.valid_password?('wrong password') 
  end

  
end
