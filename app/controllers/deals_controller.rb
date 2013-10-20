class DealsController < ApplicationController

  before_filter :load_user

  def search
    @deals =  Deal.asc(:from)
    @deals = @deals.full_text_search(params[:city]) if params[:city].present?
    case true
    when params[:start].present? && params[:end].present?
      @deals = @deals.where(:from.lte => params[:start], :till.gte => params[:end]) 
    when params[:start].present?
      @deals = @deals.where(:from.lte => params[:start])
    when params[:end].present?
      @deals = @deals.where(:till.gte => params[:end])
    end
  end

  def index
    @deals = Deal.latest.limit(4)
  end

  def show
    @deal = Deal.find(params[:id])
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

  def edit
    @deal = @user.deals.find(params[:id])
  end

  def update
    @deal = @user.deals.find(params[:id])
    if @deal.update_attributes(params[:deal])
      redirect_to deals_path
    else
      render :edit
    end
  end

  def destroy
    @deal = @user.deals.find(params[:id])
    @deal.destroy
    redirect_to deals_path
  end

  private
  def load_user
    @user = current_user
  end
end
