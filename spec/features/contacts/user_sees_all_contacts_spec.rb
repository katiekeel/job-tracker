require 'rails_helper'

describe "User sees all contacts" do
  scenario "for a specific company" do
    contact = create(:contact)
    contact_two = create(:contact, company: contact.company)

    visit company_jobs_path(contact.company)

    expect(page).to have_content(contact.name)
    expect(page).to have_content(contact.email)
    expect(page).to have_content(contact.position)
    expect(page).to have_content(contact_two.name)
    expect(page).to have_content(contact_two.email)
    expect(page).to have_content(contact_two.position)
  end



end
