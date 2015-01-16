class ImportUserJob < ActiveJob::Base
  queue_as :default

  def perform(*args	)
    puts "Start import data "
  end
end
