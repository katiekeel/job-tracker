require 'rails_helper'

describe "User sees one category" do

  scenario "and clicks link back to categories" do
    category = create(:category)

    visit category_path(category)

    click_link "Back to All Categories"

    expect(current_path).to eq "/categories"
  end

  scenario "and it shows its jobs" do
    category = create(:category)
    job = create(:job, category: category)

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("#{category.title}")
    expect(page).to have_content("#{job.title}")
  end

  scenario "and clicks link to a job" do
    category = create(:category)
    job = create(:job, category: category)

    visit category_path(category)

    click_link "#{job.title}"

    expect(current_path).to eq "/companies/#{job.company.id}/jobs/#{job.id}"
  end

  scenario "and clicks link to edit category" do
    category = create(:category)

    visit category_path(category)

    click_link "Edit Category"

    expect(current_path).to eq "/categories/#{category.id}/edit"
  end


end
