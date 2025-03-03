class EchoJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.logger.info("[EchoJob] Executing with arguments: #{args.inspect}")
  end
end
