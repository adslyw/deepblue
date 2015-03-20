class ImportUserJob < ActiveJob::Base
  queue_as :default

  def perform()
    puts "runing"+"."*100
  end
end
