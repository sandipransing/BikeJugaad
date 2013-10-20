class DealsController < ApplicationController

  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(params[:deal])
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
