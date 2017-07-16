require 'rails_helper'

describe "User edits an existing contact and" do
  scenario "the new content appears" do
    contact = create(:contact)

    visit edit_company_contact_path(contact.company, contact)

    fill_in "contact[name]", with: "Bill Contactson"
    fill_in "contact[email]", with: "bill@company.com"
    fill_in "contact[position]", with: "Some guy"

    click_button "Update Contact"

    expect(current_path).to eq "/companies/#{contact.company.id}/jobs"
    expect(page).to have_content "Bill Contactson"
  end
end
