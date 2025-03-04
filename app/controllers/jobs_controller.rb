class JobsController < ApplicationController
  def create
    job_type = params[:job_type]

    case job_type
    when "echo"
      EchoJob.perform_later(message: "Hello from EchoJob!")
      flash[:notice] = "Echo job enqueued!"
    when "fail"
      FailingJob.perform_later
      flash[:alert] = "Failing job enqueued. It will intentionally fail."
    when "retry"
      FailingRetryJob.perform_later
      flash[:alert] = "Failing retry job enqueued. It will fail and retry."
    when "delay"
      DelayedJob.set(wait: 5.minutes).perform_later(message: "This job runs in 5 minutes")
      flash[:info] = "Delayed job scheduled to run in 5 minutes."
    when "priority"
      HighPriorityJob.set(priority: -10).perform_later(message: "Urgent task!")
      flash[:warning] = "High priority job enqueued!"
    else
      flash[:alert] = "Invalid job type selected."
    end

    redirect_to root_path
  end
end

