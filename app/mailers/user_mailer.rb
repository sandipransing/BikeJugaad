class UserMailer < ActionMailer::Base
  default from: "rentmybike@sendgrid.net"

  def send_feedback(content)
    @content = content[:description]
    mail( to: content[:email],
          subject: "Feedback from #{content[:email]}")
  end
end
