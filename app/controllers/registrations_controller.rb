class RegistrationsController < ApplicationController
  def create
    name = params.fetch(:name)

    # Enqueue the welcome email via Solid Queue
    UserMailer.welcome_email(name).deliver_later

    redirect_to root_path, notice: "Welcome email is being sent!"
  end
end
