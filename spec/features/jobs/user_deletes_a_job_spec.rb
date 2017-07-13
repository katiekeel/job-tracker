require 'rails_helper'

describe "User deletes existing job and" do

  scenario "it's no longer on the jobs page for that company" do
    company = create(:company)
    job = create(:job, company: company)

    visit company_path(company)

    click_link "Delete"

    expect(current_path).to eq "/companies/#{company.id}/jobs"
    expect(page).to have_content("#{job.title} was successfully deleted!")
    expect(page).to_not have_link("#{job.title}")
  end
end
