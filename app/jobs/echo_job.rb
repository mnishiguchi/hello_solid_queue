class EchoJob < ApplicationJob
  queue_as :default

  def perform(**args)
    Rails.logger.info("[EchoJob] Executing: #{args.inspect}")
  end
end
