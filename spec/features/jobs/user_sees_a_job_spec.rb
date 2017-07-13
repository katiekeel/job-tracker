require 'rails_helper'

describe "User sees a specific job" do
  scenario "for a specific company" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_job_path(company, job)

    expect(page).to have_content("Chicken Factory")
    expect(page).to have_content("Chicken Sexer")
    expect(page).to have_content("10000")
  end

  scenario "and clicks link back to company" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_job_path(company, job)

    click_link "Back to #{company.name} Jobs"

    expect(current_path).to eq "/companies/#{company.id}/jobs"
  end
end
