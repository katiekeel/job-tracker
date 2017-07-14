require 'rails_helper'

describe "User edits an existing category" do
  scenario "and the new content appears" do
    category = create(:category, title: "...chickens?")
    visit edit_category_path(category)

    fill_in "category[title]", with: "CHICKENS!!!"
    click_button "Update"

    expect(current_path).to eq "/categories/#{Category.last.id}"
    expect(page).to have_content "CHICKENS!!!"
    expect(page).to_not have_content "...chickens?"
  end

  scenario "and clicks link back to categories" do
    category = create(:category)
    visit edit_category_path(category)

    click_link "Back to All Categories"

    expect(current_path).to eq "/categories"
  end

  scenario "and clicks link back to that category" do
    category = create(:category)
    visit edit_category_path(category)

    click_link "Back to #{category.title}"

    expect(current_path).to eq "/categories/#{category.id}"
  end

end
