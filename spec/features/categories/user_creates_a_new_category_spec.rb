require 'rails_helper'

describe "User creates a new category" do
  scenario "with valid attributes" do
    visit new_category_path

    fill_in "category[title]", with: "Fun With Chickens"
    click_button "Create"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content "Fun With Chickens"
    expect(Category.count).to eq 1
  end

  scenario "and clicks link back to all categories" do
    visit new_category_path

    click_link "Back to All Categories"
    expect(current_path).to eq "/categories"
  end
end
