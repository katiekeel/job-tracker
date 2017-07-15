require 'rails_helper'

RSpec.describe Comment, type: :model do

  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        comment = Comment.new(content: nil)
        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with content" do
        comment = create(:comment)
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a job" do
      comment = create(:comment)
      expect(comment).to respond_to(:job)
    end
  end
end
