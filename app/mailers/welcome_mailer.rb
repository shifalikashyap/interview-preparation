class WelcomeMailer < ApplicationMailer
  def send_greetings_notification(user)
    @user = user
    mail to: @user.email, subject: "Thankyou for Registration in our application"
  end
end
