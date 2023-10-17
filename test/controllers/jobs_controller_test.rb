require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @job = jobs(:one)
    @other_job = jobs(:two)
  end
  
  test "should get index" do
    get jobs_url
    assert_response :success
  end
  

  test "should get new" do
    get new_job_path
    assert_response :success
  end

  test "should get edit" do
    get edit_job_path(@job)
    assert_response :success
  end
end

