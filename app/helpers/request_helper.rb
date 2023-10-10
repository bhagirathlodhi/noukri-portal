module RequestHelper
  
  def is_job_requests(request)
    @request = request
    current_user.id == @request.job.user_id
  end
  
end
