class JobsController < ApplicationController
  

  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true).page(params[:page])
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

  def destroy
  end

  private

  
    def check_admin
      unless current_user.admin?
        redirect_to root_path, alert: 'You are not authorized to perform this action.'
      end
    end

    def job_params
      params.require(:job).permit(:title, :experience, :salary, :location, :skills, :description, :vacancy)
    end
end
