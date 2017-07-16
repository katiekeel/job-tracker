require 'rails_helper'

describe "User creates a new contact for a company" do
  scenario "with valid attributes" do
    company = create(:company)

    visit company_path(company)

    click_link "New Contact"

    fill_in "contact[name]", with: "Bill Contactson"
    fill_in "contact[email]", with: "bill@company.com"
    fill_in "contact[position]", with: "Some guy"

    click_button "Create Contact"

    contact = company.contacts.first

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content contact.name
    expect(page).to have_content contact.email
    expect(page).to have_content contact.position
  end
end
