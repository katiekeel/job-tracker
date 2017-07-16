require 'rails_helper'

describe "User sees all comments" do
  scenario "for a specific job" do
    comment = create(:comment)
    comment_two = create(:comment, job: comment.job)

    visit company_job_path(comment.job.company, comment.job)

    expect(page).to have_content(comment.content)
    expect(page).to have_content(comment_two.content)
  end

  scenario "and clicks link to create a new comment" do
    comment = create(:comment)

    visit company_job_path(comment.job.company, comment.job)

    click_link "New Comment"

    expect(current_path).to eq "/companies/#{comment.job.company.id}/jobs/#{comment.job.id}/comments/new"
  end
end
