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
end
