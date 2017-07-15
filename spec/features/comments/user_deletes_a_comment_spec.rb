require 'rails_helper'

describe "User deletes existing comment on a job and" do

  scenario "it's no longer in the list of comments for that job" do
    comment = create(:comment)

    visit company_job_path(comment.job.company, comment.job)

    click_link "Delete"

    expect(current_path).to eq "/companies/#{comment.job.company.id}/jobs/#{comment.job.id}"
    expect(page).to_not have_content(comment.content)
  end
end
