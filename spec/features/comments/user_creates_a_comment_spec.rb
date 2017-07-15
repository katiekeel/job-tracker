require 'rails_helper'

describe "User creates a new comment for a job" do
  scenario "with valid attributes" do
    job = create(:job)

    visit company_job_path(job.company, job)

    click_link "New Comment"

    expect(current_path).to eq("/companies/#{job.company.id}/jobs/#{job.id}/comments/new")

    fill_in "comment[content]", with: "This is a comment"

    click_button "Create Comment"

    expect(current_path).to eq("/companies/#{job.company.id}/jobs/#{job.id}")
    expect(page).to have_content("This is a comment")
  end

  scenario "and clicks link back to job" do
    job = create(:job)

    visit company_job_path(job.company, job)

    click_link "New Comment"

    expect(current_path).to eq("/companies/#{job.company.id}/jobs/#{job.id}/comments/new")

    click_link "Back to #{job.title}"

    expect(current_path).to eq "/companies/#{job.company.id}/jobs/#{job.id}"
  end

end
