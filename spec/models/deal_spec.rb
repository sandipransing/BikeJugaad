require 'spec_helper'
describe Deal do
  before(:each) do
    @deal = build(:deal)
    @user = create(:user)
    @deal.user = @user
  end

  context "Should be create" do
    it "Should be create vehicle if all mandetory filed fillup" do
      expect(@deal.save).to eq(true)
    end

    it "assign owner for vehicle" do
      @deal.save
      expect(@deal.user_id).to eq(@user.id)
    end
  end

  context "Should not create" do
    it "when vehicle type blank" do
      @deal.vehicle_type = nil
      expect(@deal.save).not_to eq(true)
    end
    
    it "when from_date blank" do
      @deal.from = nil
      expect(@deal.save).not_to eq(true)
    end
    
    it "when to_date blank" do
      @deal.till = nil
      expect(@deal.save).not_to eq(true)
    end
    
    it "when owner blank" do
      @deal.user = nil
      expect(@deal.save).not_to eq(true)
    end
  end
end
