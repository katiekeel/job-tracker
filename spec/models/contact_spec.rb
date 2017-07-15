require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "Validations" do
    it "is invalid without a name" do
      contact = build(:contact, name: nil)
      expect(contact).to be_invalid
    end

    it "is invalid without a position" do
      contact = build(:contact, position: nil)
      expect(contact).to be_invalid
    end

    it "is invalid without an email" do
      contact = build(:contact, email: nil)
      expect(contact).to be_invalid
    end

    it "is valid when all attributes are present" do
      contact = create(:contact)
      expect(contact).to be_valid
    end
  end

  describe "Relationships" do
    it "belongs to a company" do
      contact = create(:contact)
      expect(contact).to respond_to(:company)
    end
  end

end
