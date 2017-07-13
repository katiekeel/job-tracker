require 'rails_helper'

describe "User sees all companies" do
  scenario "and their content appears" do
    company = create(:company, name: "ESPN")
    company_two = create(:company, name: "Disney")

    visit companies_path

    expect(page).to have_content("ESPN")
  end

end
