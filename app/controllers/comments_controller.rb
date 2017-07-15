class CommentsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:job_id])
    @comment = Comment.new
  end

  def create
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:job_id])
    @comment = @job.comments.new(comment_params)
    if @comment.save
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:job_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      redirect_to company_job_path(@comment.job.company, @comment.job)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @job = Job.find(params[:job_id])
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to company_job_path(@company, @job)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
