require 'rails_helper'

describe "User edits an existing comment and" do
  scenario "the new content appears" do
    comment = create(:comment)

    visit edit_company_job_comment_path(comment.job.company, comment.job, comment)

    expect(current_path).to eq "/companies/#{comment.job.company.id}/jobs/#{comment.job.id}/comments/#{comment.id}/edit"

    fill_in "comment[content]", with: "Here's some content"

    click_button "Update Comment"

    edited_comment = Comment.last

    expect(current_path).to eq "/companies/#{comment.job.company.id}/jobs/#{comment.job.id}"
    expect(page).to have_content(edited_comment.content)
    expect(page).to_not have_content(comment.content)
  end

  scenario "and clicks link back to that job" do
    comment = create(:comment)

    visit edit_company_job_comment_path(comment.job.company, comment.job, comment)

    expect(current_path).to eq "/companies/#{comment.job.company.id}/jobs/#{comment.job.id}/comments/#{comment.id}/edit"

    click_link "Back to #{comment.job.title}"

    expect(current_path).to eq "/companies/#{comment.job.company.id}/jobs/#{comment.job.id}"
  end
end
