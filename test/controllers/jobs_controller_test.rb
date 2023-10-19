require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @job = jobs(:one)
    @other_job = jobs(:two)
    @user = users(:michael)
  end
  
  test "should get index" do
    sign_in users(:michael)
    get jobs_url
    assert_response :success
  end
  

  test "should get new" do
    sign_in users(:michael)
    get new_job_path
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:michael)
    get edit_job_path(@job)
    assert_response :success
  end
end

