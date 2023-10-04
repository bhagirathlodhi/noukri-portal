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

  def pending
    @user = @request.users.find(params[:id])
    @applicant.update(status: 'Pending')
    redirect_to application_applicants_path(@application)
  end

  def accept
    @applicant = @application.applicants.find(params[:id])
    @applicant.update(status: 'Accepted')
    redirect_to application_applicants_path(@application)
  end

  def reject
    @applicant = @application.applicants.find(params[:id])
    @applicant.update(status: 'Rejected')
    redirect_to application_applicants_path(@application)
  end


  private

  def has_applied?
    if Job.where(user_id: :current_user.id, job_id: params[:job_id]).any?
      redirect_to :index, alert: "You have already applied"
    end
  end
  def set_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:name, :age, :address, :currentsalary, :position, :yop, :contact_number, :email, :status)
  end
end
