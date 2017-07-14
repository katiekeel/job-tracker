require 'rails_helper'

RSpec.describe Company do
  describe "Validations" do
    it "is invalid without a title" do
      category = Category.new(title: nil)
      expect(category).to be_invalid
    end

    it "has a unique title" do
      category = create(:category, title: "Not Unique")
      category_two = Category.new(title: "Not Unique")
      expect(category_two).to be_invalid
    end

    it "is valid with a name" do
      category = create(:category)
      expect(category).to be_valid
    end
  end

  describe "Relationships" do
    it "has many jobs" do
      category = create(:category)
      expect(category).to respond_to(:jobs)
    end
  end
end
