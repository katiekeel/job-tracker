require 'rails_helper'

describe "User sees one company" do

  scenario "and clicks link back to companies" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_path(company)

    click_link "Back to All Companies"

    expect(current_path).to eq "/companies"
  end

  scenario "and it shows its jobs" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("#{company.name}")
    expect(page).to have_content("#{job.title}")
  end

  scenario "and clicks link to create a new job" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_path(company)

    click_link "Create A New Job for #{company.name}"

    expect(current_path).to eq "/companies/#{company.id}/jobs/new"
  end

  scenario "and clicks link to a job" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_path(company)

    click_link "#{job.title}"

    expect(current_path).to eq "/companies/#{company.id}/jobs/#{job.id}"
  end

  scenario "and clicks link to edit company" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_path(company)

    click_link "Edit #{company.name}"

    expect(current_path).to eq "/companies/#{company.id}/edit"
  end


end
