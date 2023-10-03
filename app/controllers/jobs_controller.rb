class JobsController < ApplicationController
  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true)
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

  def show
    @job = Job.find(params[:id])
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

  def search
    if params[:search].blank?
      redirect_to root_path
    else 
      @parammeter = params[:search].downcase
      @result  = Job.all.where("lower(title) LIKE :search", search: "%#{@parameter}")
    end
  end

  private

  def job_params
    params.require(:job).permit(:title, :experience, :salary, :location, :skills, :description)
  end
end
