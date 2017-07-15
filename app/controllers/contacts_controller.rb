class ContactsController < ApplicationController

  def new
    @company = Company.find(params[:company_id])
    @contact = Contact.new
  end

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new(contact_params)
    if @contact.save
      flash[:success] = "You created #{@contact.name} for #{@company.name}!"
      redirect_to company_jobs_path(@company)
    else
      render :new
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @contact = Contact.find(params[:id])
  end


  def update
    @company = Company.find(params[:company_id])
    @contact = Contact.find(params[:id])
    @contact.update(contact_params)
    if @contact.save
      flash[:success] = "#{@contact.name} updated!"
      redirect_to company_jobs_path(@company)
    else
      render :edit
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @contact = Contact.find(params[:id])
    @contact.destroy

    flash[:success] = "#{@contact.name} was successfully deleted!"
    redirect_to company_jobs_path(@company)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email, :company_id)
  end


end
