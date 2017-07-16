require 'rails_helper'

describe "User sees a specific contact" do
  scenario "for a specific company" do
    contact = create(:contact)

    visit company_jobs_path(contact.company)

    expect(page).to have_content "Satan McChicken"
  end
end
