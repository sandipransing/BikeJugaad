require 'spec_helper'

describe User do
  before(:each) do
    @user = build(:user)
  end

  context "Should create" do
    it "should create user if email address and password present" do
      expect(@user.save).to eq(true)
    end
  end

  context "Should not create" do
    it "should not create user if email address is blank" do
      @user.email = ""
      expect(@user.save).not_to eq(true)
    end

    it "should not create user if email address is invalid" do
      @user.email = "test"
      expect(@user.save).not_to eq(true)
    end
  end

  context "Should build deals" do
    it "should check for user's deals" do
    end
  end
end
