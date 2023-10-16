require "test_helper"

class RequestControllerTest < ActionDispatch::IntegrationTest
  def setup
    @job = jobs(:developer)
    @other_job = jobs(:HR)
  end
  
  test "should get index" do
    get job_requests_path
    assert_response :success
  end
end
