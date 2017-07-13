require 'rails_helper'

describe "User creates a new company" do
  scenario "with valid attributes" do
    visit new_company_path

    fill_in "company[name]", with: "ESPN"
    click_button "Create"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs")
    expect(page).to have_content("ESPN")
    expect(Company.count).to eq(1)
  end

  scenario "and clicks link back to all companies" do
    visit new_company_path

    click_link "Back to All Companies"

    expect(current_path).to eq "/companies"
  end
end
