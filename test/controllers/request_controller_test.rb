require "test_helper"

class RequestControllerTest < ActionDispatch::IntegrationTest
  def setup
    @job = jobs(:one)
    @other_job = jobs(:two)
  end
  
  test "should get index" do
    get job_requests_path(@requests)
    assert_response :success
  end
end
