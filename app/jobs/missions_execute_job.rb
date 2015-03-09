class MissionsExecuteJob < ActiveJob::Base
  queue_as :default

  def perform(task_id)

  end

end
