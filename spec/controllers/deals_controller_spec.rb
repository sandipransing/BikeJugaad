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
      sign_in @user
      xhr :get, :show, id: @deal
      expect(assigns(:deal)).to eq @deal
    end
  end

  describe 'GET #new' do
    it "should get new deal" do
      sign_in @user
      get :new
      deal = assigns(:deal)
      expect(deal.from).to eq(Date.today)
      expect(deal.till).to eq(Date.today + 3.days)
      expect(response).to render_template :new
    end

    it "should not get new deal" do
      get :new
      expect(response).to redirect_to root_path
    end
  end

  describe 'Get #edit' do
    it "should get edit for specified deal" do
      sign_in @user
      get :edit, id: @deal
      expect(assigns(:deal)).to eq @deal
      expect(response).to render_template :edit
    end

    it "should not edit a deal" do
      get :edit, id: @deal
      expect(response).to redirect_to root_path
    end
  end

  describe 'PUT #update' do
    it "should update a specified deal" do
      sign_in @user
      put :update, id: @deal, deal: attributes_for(:deal, make: 'Hero')
      @deal.reload
      expect(assigns(:deal)).to eq(@deal)
    end

    it "should not update a deal" do
      put :update, id: @deal, deal: attributes_for(:deal, till: (Date.today - 2.days))
      expect(response).to redirect_to root_path
    end
  end
end
