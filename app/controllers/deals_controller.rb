class DealsController < ApplicationController

  def index
    @deals = Deal.asc(:from)
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

  def edit
    @deal = Deal.find(params[:id])
  end

  def update
    @deal = Deal.find(params[:id])
    if @deal.update_attributes(params[:deal])
      redirect_to deals_path
    else
      render :edit
    end
  end
  
  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy
    redirect_to deals_path
  end

  def countries
    @countries = Country.all
  end

  def cities
    @cities = City.all
  end

end
