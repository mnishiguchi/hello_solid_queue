class FailingJob < ApplicationJob
  queue_as :default

  def perform(**args)
    raise "This job always fails!"
  end
end
