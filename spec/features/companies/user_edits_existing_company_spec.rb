require 'rails_helper'

describe "User edits an existing company" do
  scenario "and the new content appears" do
    company = create(:company, name: "ESPN")
    visit edit_company_path(company)

    fill_in "company[name]", with: "EA Sports"
    click_button "Update"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs")
    expect(page).to have_content("EA Sports")
    expect(page).to_not have_content("ESPN")
  end

  scenario "and clicks link back to companies" do
    company = create(:company, name: "ESPN")
    visit edit_company_path(company)

    click_link "Back to All Companies"

    expect(current_path).to eq "/companies"
  end

  scenario "and clicks link back to that company" do
    company = create(:company, name: "ESPN")
    visit edit_company_path(company)

    click_link "Back to #{company.name}"

    expect(current_path).to eq "/companies/#{company.id}/jobs"
  end

end
