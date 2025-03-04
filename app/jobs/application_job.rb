class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  discard_on ActiveJob::DeserializationError

  # Error reporting on jobs
  # https://github.com/rails/solid_queue#error-reporting-on-jobs
  rescue_from(Exception) do |exception|
    Rails.error.report(exception)
    raise exception
  end
end
