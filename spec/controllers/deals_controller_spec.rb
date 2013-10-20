require 'spec_helper'

describe DealsController do
  before(:each) do
    @user = create(:user)
    @deal = build(:deal)
    @deal.user = @user
    @deal.save
  end

  describe 'GET #index' do
    it "should show four latest deals" do
      get :index
      expect(assigns(:deals)).to match_array [@deal]
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "should show deal for specified id" do
      get :show, id: @deal
      expect(assigns(:deal)).to eq @deal
    end
  end
end
