class RequestsController < ApplicationController
  # before_action :set_request, only: [:show, :edit, :update, :destroy, :accept, :reject]

  def index
    #if current_user.admin? 
      #User.find(5).jobs.last.requests
      # @p = current_user.jobs.requests
      @p = Request.ransack(params[:p])
      @requests = @p.result(distinct: true).page(params[:page])
    # else
    #   @p = Request.ransack(params[:p])
    #   @requests = @p.result(distinct: true).page(params[:page])
    # end
    # authorize! :read, @requests
    # @p = Request.ransack(params[:p])
    # @requests = @p.result(distinct: true).page(params[:page])
    # @requests = Request.all
  end

  def new
    @job = Job.find_by(id: params[:job_id])
    @request = @job.requests.new
  end

  def create
    @job = Job.find_by(id: params[:job_id])
    @request = @job.requests.create(request_params)
    if @request.save
      SendMailMailer.apply_notification(@request).deliver_now
      flash.now[:success] = "Applied Successfully"
      redirect_to root_path 
    end
  end
  def show
    @request = Request.find(params[:id])
  end

  def accept
    @job = Job.find_by(id: params[:job_id])
    @request = @job.requests.find(params[:request_id])
    if @request.status != "accepted" && @request.update(status: :accepted)
      flash[:alert] = "has been Accepted."
      redirect_to request.referrer
      SendMailMailer.confirm_notification(@request).deliver_now
    else
      redirect_to request.referrer, notice: " already Accepted"
    end
  end

  def reject
    @job = Job.find_by(id: params[:job_id])
    @request = @job.requests.find(params[:request_id])
    if @request.status != "rejected" && @request.update(status: :rejected)
      flash[:alert] = "Application has been rejected."
      redirect_to request.referrer
      SendMailMailer.reject_notification(@request).deliver_now
    else
      redirect_to request.referrer, notice: "Application already rejected"
    end
  end

  private

    def set_request
      @request = Request.find(params[:id])
    end

    def request_params
      params.require(:request).permit(:name, :gender, :date_of_birth, :address, :currentsalary, :position, :yop, :contact_number, :email, :status, :resume)
    end
end
