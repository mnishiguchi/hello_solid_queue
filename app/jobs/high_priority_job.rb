class HighPriorityJob < ApplicationJob
  queue_as :critical

  def perform(**args)
    Rails.logger.info("[HighPriorityJob] Handling urgent task: #{args.inspect}")
  end
end
