class DealsController < ApplicationController

  before_filter :load_user

  def index
    @country = Country.where(code: 'IN').first
    @cities = @country.cities.to_json
    @deals = Deal.all
  end

  def new
    @deal = @user.deals.new
  end

  def create
    @deal = @user.deals.new(params[:deal])
    if @deal.save
      redirect_to deals_path
    else
      render :new
    end
  end
  
  private
  def load_user
    @user = current_user
  end
end
