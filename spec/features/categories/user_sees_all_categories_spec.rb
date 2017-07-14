require 'rails_helper'

describe "User visits all categories" do
  scenario "and sees their content" do
    categories = create(:category)

    visit categories_path

    expect(page).to have_content("#{category.title}")
  end

  scenario "and clicks link to see first category" do
    categories = create(:category)

    visit categories_path

    click_link "#{category.name}"

    expect(current_path).to eq "/categories/#{category.id}/jobs"
  end

  scenario "and clicks link to edit first category" do
    categories = create(:category)

    visit categories_path

    click_link "Edit"

    expect(current_path).to eq "/categories/#{category.id}/edit"
  end

  scenario "and clicks link to delete first category" do
    categories = create(:category)

    visit categories_path

    click_link "Delete"

    expect(current_path).to eq "/categories"
    expect(page).to_not have_link("#{category.name}")
  end

  scenario "and clicks link to create a new company" do
    visit categories_path

    click_link "Create A New Category"

    expect(current_path).to eq "/categories/new"
  end

  scenario "and clicks link back to home" do
    visit categories_path

    click_link "Back to Home"

    expect(current_path).to eq "/"
  end

end
