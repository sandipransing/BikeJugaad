class DealsController < ApplicationController

  def index
    @deals = Deal.all
  end

  def new
    @deal = current_user.deals.new
  end

  def create
    @deal = current_user.deals.new(params[:deal])
    if @deal.save
      redirect_to deals_path
    else
      render :new
    end
  end

  def countries
    @countries = Country.all
  end

  def cities
    @cities = City.all
  end

end
