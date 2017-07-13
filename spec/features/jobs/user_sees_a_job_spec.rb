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
end
