require 'rails_helper'

describe "User edits an existing job and" do
  scenario "the new content appears" do
    company = create(:company, name: "ESPN")
    job = create(:job, company: company)

    visit edit_company_job_path(company, job)

    fill_in "job[title]", with: "Happy Meal Inspector"
    fill_in "job[description]", with: "Makes sure meals are sufficiently happy"
    fill_in "job[level_of_interest]", with: 15
    fill_in "job[city]", with: "HappyLand"

    click_button "Update Job"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content("Happy Meal Inspector")
    expect(page).to_not have_content("Chicken Sexer")
    expect(page).to have_content("Makes sure meals are sufficiently happy")
    expect(page).to_not have_content("Sexin' chickens")
    expect(page).to have_content("15")
    expect(page).to_not have_content("10000")
    expect(page).to have_content("HappyLand")
    expect(page).to_not have_content("Chickenville")
  end

  scenario "and clicks link back to that company" do
    company = create(:company, name: "ESPN")
    job = create(:job, company: company)

    visit edit_company_job_path(company, job)

    click_link "Back to All Jobs for #{company.name}"

    expect(current_path).to eq "/companies/#{company.id}/jobs"
  end


end
