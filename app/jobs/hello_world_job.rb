class HelloWorldJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "You are now inside HelloWorldJob"
    logger.info "Your job is now in processing ..."
  end
end
