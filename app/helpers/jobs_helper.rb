module JobsHelper
  def has_applied(job)
    @job = job
    @request = @job.requests
    @request.each do |rq|
      @result = current_user.email == rq.email
    end
    return @result
  end
end
