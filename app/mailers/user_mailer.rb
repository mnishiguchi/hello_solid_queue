class UserMailer < ApplicationMailer
  default from: "no-reply@example.com"

  def welcome_email(name)
    @name = name
    mail(to: "test@example.com", subject: "Welcome to SampleApp!")
  end
end
