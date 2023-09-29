class JobsController < ApplicationController
  def index
    @jobs  = Job.all
  end

  def new
    @job  = Job.new
  end
  
  def create
    @user = User.find_by(id: current_user.id)
    @job = @user.jobs.build(job_params)
    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
    
  end

  def edit
    @job = Job.find(params[:id])
  end
  def def update
    if @job.update(job_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def job_params
    params.require(:job).permit(:title, :experience, :salary, :location, :skills, :description)
  end
end
