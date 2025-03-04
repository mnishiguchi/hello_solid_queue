class FailingRetryJob < ApplicationJob
  queue_as :default

  retry_on StandardError, attempts: 7, wait: ->(executions) { (executions**4) + rand(0..30) }

  def perform(**args)
    Rails.logger.info "Executing FailingRetryJob"
    raise StandardError, "This job fails on purpose!"
  end
end
