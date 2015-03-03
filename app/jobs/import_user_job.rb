class ImportUserJob < ActiveJob::Base
  queue_as :default

  def perform()
    BcvService.new.process
  end
end
