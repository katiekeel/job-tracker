require 'rails_helper'

describe "User sees all jobs" do
  scenario "for a specific company" do
    company = create(:company)
    category = create(:category)
    generic_job = create(:job, company: company, category: category)
    specific_job = create(:job, title: "Master Chicken Sexer", company: company, category: category)

    visit company_path(company)

    expect(page).to have_content("Chicken Factory")
    expect(page).to have_content("Chicken Sexer")
    expect(page).to have_content("Master Chicken Sexer")
  end

  scenario "and clicks link back to companies" do
    company = create(:company)
    category = create(:category)
    job = create(:job, company: company, category: category)

    visit company_path(company)

    click_link "Back to All Companies"

    expect(current_path).to eq "/companies"
  end

  scenario "and clicks link to create a new job" do
    company = create(:company)
    category = create(:category)
    job = create(:job, company: company, category: category)

    visit company_path(company)

    click_link "New Job"

    expect(current_path).to eq "/companies/#{company.id}/jobs/new"
  end

  scenario "and clicks link to edit company" do
    company = create(:company)
    category = create(:category)
    job = create(:job, company: company, category: category)

    visit company_path(company)

    click_link "Edit Company"

    expect(current_path).to eq "/companies/#{company.id}/edit"
  end


  scenario "and clicks link to a job" do
    company = create(:company)
    category = create(:category)
    job = create(:job, company: company, category: category)

    visit company_path(company)

    click_link "#{job.title}"

    expect(current_path).to eq "/companies/#{company.id}/jobs/#{job.id}"
  end

end
