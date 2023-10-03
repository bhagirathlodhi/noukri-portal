class RequestsController < ApplicationController
  #before_action :set_request, only: [:show, :edit, :update, :destroy, :accept, :reject]

  def index
    @requests = Request.all
  end


  def new
    @job = Job.find_by(id: params[:job_id])
    @request = @job.requests.new
  end

  def create
    @job = Job.find_by(id: params[:job_id])
    @request = @job.requests.build(request_params)
    if @request.save
      #SendMailMailer.apply_notification(@request).deliver_now
      flash[:success] = "Applied Successfully"
      redirect_to root_path 
    end
  end

  def accept
    @request.update(status: 'accepted')
    redirect_to @request.job, notice: 'Application accepted.'
  end

  def reject
    @request.update(status: 'rejected')
    redirect_to @request.job, notice: 'Application rejected.'
  end

  private

  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:name, :age, :address, :currentsalary, :position, :yop, :contact_number, :email)
  end
end
