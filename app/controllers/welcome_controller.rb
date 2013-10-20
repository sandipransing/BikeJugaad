class WelcomeController < ApplicationController
  def details
    @menu = 'details'
  end

  def contact_us
    @menu = 'contact_us'
  end
end
