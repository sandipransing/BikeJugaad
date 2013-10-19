require 'spec_helper'
describe Vehicle do
  before(:each) do
    @vehicle = build(:vehicle)
    @user = create(:user)
    @vehicle.user = @user
  end

  context "Should be create" do
    it "Should be create vehicle if all mandetory filed fillup" do
      expect(@vehicle.save).to eq(true)
    end

    it "assign owner for vehicle" do
      @vehicle.save
      expect(@vehicle.user_id).to eq(@user.id)
    end
  end

  context "Should not create" do
    it "when vehicle type blank" do
      @vehicle.vehicle_type = nil
      expect(@vehicle.save).not_to eq(true)
    end
    
    it "when from_date blank" do
      @vehicle.from_date = nil
      expect(@vehicle.save).not_to eq(true)
    end
    
    it "when to_date blank" do
      @vehicle.from_date = nil
      expect(@vehicle.save).not_to eq(true)
    end
    
    it "when owner blank" do
      @vehicle.user = nil
      expect(@vehicle.save).not_to eq(true)
    end
  end
end
