class JobsController < ApplicationController

  def index
    # byebug
    if params[:company_id].nil? == false
      @company = Company.find(params[:company_id])
      @contacts = @company.contacts
      @jobs = @company.jobs
    elsif params[:sort] == "location"
      @jobs = Job.by_city
      request.variant = :location
    elsif params[:sort] == "interest"
      @jobs = Job.by_interest
      request.variant = :interest
    elsif params.key?(:location)
      @location = params[:location]
      @jobs = Job.where(city: params[:location])
      request.variant = :city
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
  end

  def update
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = "#{@job.title} updated!"
      redirect_to company_job_path(@company, @job)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:id])
    @job.destroy

    flash[:success] = "#{@job.title} was successfully deleted!"
    redirect_to company_jobs_path(@company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
