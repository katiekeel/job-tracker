class CategoriesController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @jobs = category.jobs
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.title} added!"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    category = Category.find(params[:id])
    redirect_to category_jobs_path(category)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    if @category.save
      flash[:success] = "#{@category.title} updated!"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    flash[:success] = "#{category.name} was successfully deleted!"
    redirect_to categories_path
  end


  private

  def company_params
    params.require(:category).permit(:title)
  end

end
