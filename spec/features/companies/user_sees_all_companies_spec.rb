require 'rails_helper'

describe "User visits all companies" do
  scenario "and sees their content" do
    company = create(:company, name: "ESPN")

    visit companies_path

    expect(page).to have_content("ESPN")
  end

  scenario "and clicks link to see first company" do
    company = create(:company)

    visit companies_path

    click_link "#{company.name}"

    expect(current_path).to eq "/companies/#{company.id}/jobs"
  end

  scenario "and clicks link to edit first company" do
    company = create(:company)

    visit companies_path

    click_link "Edit"

    expect(current_path).to eq "/companies/#{company.id}/edit"
  end

  scenario "and clicks link to delete first company" do
    company = create(:company)

    visit companies_path

    click_link "Delete"

    expect(current_path).to eq "/companies"
    expect(page).to_not have_link("#{company.name}")
  end

  scenario "and clicks link to create a new company" do
    visit companies_path

    click_link "Create A New Company"

    expect(current_path).to eq "/companies/new"
  end

  scenario "and clicks link back to home" do
    visit companies_path

    click_link "Back to Home"

    expect(current_path).to eq "/"
  end

end
