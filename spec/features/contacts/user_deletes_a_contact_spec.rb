require 'rails_helper'

describe "User deletes existing contact and" do
  scenario "it's no longer on the page for that company's jobs" do
    contact = create(:contact)

    visit company_jobs_path(contact.company)

    within(".contact") do
      click_link "Delete"
    end

    expect(current_path).to eq "/companies/#{contact.company.id}/jobs"
    expect(page).to_not have_content contact.email
  end
end
