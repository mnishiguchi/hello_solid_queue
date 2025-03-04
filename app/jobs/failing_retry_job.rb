class FailingRetryJob < ApplicationJob
  queue_as :default

  retry_on StandardError, attempts: 7, wait: ->(executions) { (executions**4) + rand(0..30) }

  def perform(**args)
    Rails.logger.info "Executing FailingRetryJob, attempt: #{executions}"

    case executions
    when 1
      Rails.logger.info "First attempt, failing..."
    when 3
      Rails.logger.info "Third attempt, doing something before failing..."
    when 5
      Rails.logger.info "Fifth attempt, partial success but still failing..."
    when 7
      Rails.logger.info "Final attempt, allowing job to succeed!"
      return # Stop execution here to succeed
    else
      Rails.logger.info "Failing..."
    end

    raise StandardError, "This job fails! Attempt: #{executions}"
  end
end
