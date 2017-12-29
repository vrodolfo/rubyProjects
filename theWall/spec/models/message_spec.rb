#Factory Girl, testing functionalities and automatically creating rows in the DB for you.
require 'rails_helper'

RSpec.describe Message, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context "With valid attributes" do 
    it "should save" do 
      expect(build(:message)).to be_valid
    end
  end
  context "With invalid attributes" do 
    it "should not save if message field is blank" do
      expect(build(:message, message: "")).to be_invalid
    end
    it "should not save if message field is less than 10 char long" do
      expect(build(:message, message: "ABCDE")).to be_invalid
    end

    # it "should not save if user is missing" do
    #   expect(build(:user, user_id: "")).to be_invalid
    # end
  end

end
