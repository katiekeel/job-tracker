require 'rails_helper'

describe "User sees a comment" do
  scenario "for a specific job" do
    comment = create(:comment)

    visit company_job_path(comment.job.company, comment.job)

    expect(page).to have_content(comment.content)
  end
end
