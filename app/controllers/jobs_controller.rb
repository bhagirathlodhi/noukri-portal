class JobsController < ApplicationController
  def index
    @jobs  = Job.all
  end

  def new
    @job  = Job.new
  end
  
  def create
    @job  = Job.new(job_params)
    if @job.save
      redirect_to root_path, notice: "Post created"
    else
      render :new
    end
    
  end

  def edit

  end

  def destroy
  end

  private

  def job_params
    params.require(:job).permit(:title, :experience, :salary, :location, :skills, :description)
  end
end
