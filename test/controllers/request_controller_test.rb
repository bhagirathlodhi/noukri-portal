require "test_helper"

class RequestControllerTest < ActionDispatch::IntegrationTest
  def setup
    @request = requests(:one)
    @job = jobs(:one)
    @other_job = jobs(:two)
    @user = users(:michael)
  end
  
  test "should get index" do
    sign_in users(:michael)
    get job_requests_path(@request)
    assert_response :success
  end

  test "should get show" do
    sign_in users(:michael)
    get job_request_path(@job, @request)
    assert_response :success
  end
  
  test "accept" do
    sign_in users(:michael)
    get job_requests_path(@request)
    
  end
end
