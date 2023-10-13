class JobsController < ApplicationController
  before_action :find_job, only: %i[show edit]

  def index
    if current_user.admin?
      @q = current_user.jobs.ransack(params[:q])
      @jobs = @q.result(distinct: true).page(params[:page])
    else
      @q = Job.ransack(params[:q])
      @jobs = @q.result(distinct: true).page(params[:page])
    end
  end

  def new
    @job  = Job.new
  end
  
  def create
    @user = User.find_by(id: current_user.id)
    @job = @user.jobs.build(job_params)
    if @job.save
      flash[:success] = "Job Created"
      redirect_to jobs_path
    else
      render :new, status: :see_other
    end
  end

  def show 
  end

  def edit 
  end

  def def update
    debugger
    if @job.update(job_params)
      flash[:success] = "Updated Successfully"
      redirect_to root_path
    else
      render :edit, status: :see_other
    end
  end

  private

    def find_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :experience, :salary, :location, :skills, :description, :vacancy)
    end
end
