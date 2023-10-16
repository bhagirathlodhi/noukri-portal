module JobsHelper
  def has_applied(job)
    @job = job
    @request = @job.requests
    @request.each do |rq|
      return if current_user.email == rq.email
    end
    
  end
end
