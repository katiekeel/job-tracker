require 'rails_helper'

describe "User deletes existing category" do
  scenario "and it's no longer there" do
    category = create(:category)

    visit categories_path

    click_link "Delete"

    expect(current_path).to eq "/categories"
    expect(page).to_not have_link "#{category.title}"
    expect(page).to have_content "#{category.title} was successfully deleted!"
  end
end
