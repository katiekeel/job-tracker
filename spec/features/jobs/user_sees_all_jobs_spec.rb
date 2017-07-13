require 'rails_helper'

describe "User sees all jobs" do
  scenario "for a specific company" do
    company = create(:company)
    generic_job = create(:job, company: company)
    specific_job = create(:job, title: "Master Chicken Sexer", company: company)

    visit company_path(company)

    expect(page).to have_content("Chicken Factory")
    expect(page).to have_content("Chicken Sexer")
    expect(page).to have_content("Master Chicken Sexer")
  end

  scenario "and clicks link back to companies" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_path(company)

    click_link "Back to All Companies"

    expect(current_path).to eq "/companies"
  end

  scenario "and clicks link to create a new job" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_path(company)

    click_link "Create A New Job for #{company.name}"

    expect(current_path).to eq "/companies/#{company.id}/jobs/new"
  end

  scenario "and clicks link to edit company" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_path(company)

    click_link "Edit #{company.name}"

    expect(current_path).to eq "/companies/#{company.id}/edit"
  end


  scenario "and clicks link to a job" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_path(company)

    click_link "#{job.title}"

    expect(current_path).to eq "/companies/#{company.id}/jobs/#{job.id}"
  end

end
