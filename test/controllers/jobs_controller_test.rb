require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    sign_in @user
  end
  
  test "should get index" do
    get jobs_path
    assert_response :success
  end

  test "should get new" do
    get new_job_path
    assert_response :success
  end

  test "should get edit" do
    get edit_job_path
    assert_response :success
  end
end
