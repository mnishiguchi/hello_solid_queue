class DelayedJob < ApplicationJob
  queue_as :default

  def perform(**args)
    Rails.logger.info("[DelayedJob] Executed after delay: #{args.inspect}")
  end
end
