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
end
