require 'rails_helper'

describe "User creates a new job" do
  scenario "with valid attributes" do
    company = create(:company)
    category = create(:category, title: "Fun With Chickens")
    visit new_company_job_path(company)

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select "Fun With Chickens", from: "job_category_id"

    click_button "Create Job"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("Chicken Factory")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end

  scenario "and clicks link to create a new category" do
    company = create(:company)
    visit new_company_job_path(company)

    click_link "Create a new one"

    expect(current_path).to eq "/categories/new"
  end

  scenario "and clicks link back to company" do
    company = create(:company)
    visit new_company_job_path(company)

    click_link "Back to #{company.name}"

    expect(current_path).to eq "/companies/#{company.id}/jobs"
  end
end
