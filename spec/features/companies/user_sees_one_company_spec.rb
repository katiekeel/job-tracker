require 'rails_helper'

describe "User sees one company" do
  scenario "and it shows its jobs" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("Chicken Factory")
    expect(page).to have_content("Chicken Sexer 1")
  end
end
