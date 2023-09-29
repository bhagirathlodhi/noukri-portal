class RequestController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    debugger
    @job = Job.find_by(id: job.id)
    @request = @job.requests.build(request_params)
    if @request.save
      redirect_to root_path
    end
  end


  private

  def request_params
    params.require(:request).permit(:name, :age, :address, :currentsalary, :position, :yop, :contact_number, :email)
  end
end
