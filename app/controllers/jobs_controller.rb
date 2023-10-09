class JobsController < ApplicationController
  before_action :authenticate_user!

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
      flash.now[:success] = "Job Created"
      redirect_to jobs_path
    else
      render :new, status: :see_other
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def def update
    if @job.update(job_params)
      flash.now[:success] = "Updated Successfully"
      redirect_to root_path
    else
      render :edit, status: :see_other
    end
  end

  private

    def job_params
      params.require(:job).permit(:title, :experience, :salary, :location, :skills, :description, :vacancy)
    end
end
