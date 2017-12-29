#Factory Girl
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  context "With valid attributes" do 
    it "should save" do 
      expect(build(:user)).to be_valid
    end
  end
  context "With invalid attributes" do 
    it "should not save if username field is blank" do
      expect(build(:user, username: "")).to be_invalid
    end
    it "should not save if username field is longer than 5 chars" do
      expect(build(:user, username: "A")).to be_invalid
    end
    it "should not save if username already exists" do
      User.create(username:"Test11")
      expect(build(:user, username: "Test11")).to be_invalid
    end
  end
end
