class DealsController < ApplicationController
  def countries
    @countries = Country.all
  end

  def cities
    @cities = City.all
  end
end
