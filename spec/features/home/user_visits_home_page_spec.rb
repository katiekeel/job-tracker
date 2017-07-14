require 'rails_helper'

describe "User visits the home page and" do

  scenario "clicks the link to all companies" do
    visit root_path

    click_link "All Companies"

    expect(current_path).to eq "/companies"
  end

  scenario "clicks the link to all categories" do
    visit root_path

    click_link "All Categories"

    expect(current_path).to eq "/categories"
  end
end
