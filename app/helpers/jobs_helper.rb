module JobsHelper

  def applied_to_this_job?
    request.exists? user_id: current_user.id
  end

end
