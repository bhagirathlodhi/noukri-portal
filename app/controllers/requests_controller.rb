class RequestsController < ApplicationController
  before_action :find_job, only: %i[new create accept reject]
  before_action :find_request, only: %i[accept reject]

  def index
    @p = Request.ransack(params[:p])
    @requests = @p.result.page params[:page]
  end

  def new
    @request = @job.requests.new
  end

  def create
    @request = @job.requests.create(request_params)
    if @request.save
      SendMailMailer.apply_notification(@request).deliver_now
      flash[:success] = "Applied Successfully"
      redirect_to root_path 
    end
  end
  
  def show
    @request = Request.find(params[:id])
  end

  def accept  
    if @request.status != "accepted" && @request.update(status: :accepted)
      flash[:alert] = "has been Accepted."
      redirect_to request.referrer
      SendMailMailer.confirm_notification(@request).deliver_now
    else
      redirect_to request.referrer, notice: "Application already Accepted"
    end
  end

  def reject
    if @request.status != "rejected" && @request.update(status: :rejected)
      flash[:alert] = "Application has been rejected."
      redirect_to request.referrer
      SendMailMailer.reject_notification(@request).deliver_now
      @request.destroy
    else
      redirect_to request.referrer, notice: "Application already rejected"
    end
  end

  private

    def find_job
      @job = Job.find_by(id: params[:job_id])
    end

    def find_request
      @request = @job.requests.find(params[:request_id])
    end

    def request_params
      params.require(:request).permit(:name, :gender, :date_of_birth, :address, :currentsalary, :position, :yop, :contact_number, :email, :status, :resume)
    end
end
