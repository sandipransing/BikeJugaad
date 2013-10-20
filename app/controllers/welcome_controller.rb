class WelcomeController < ApplicationController
  def feedback
    @feedback = params[:feedback]
    UserMailer.send_feedback(@feedback).deliver
    redirect_to contact_us_path
  end
end
