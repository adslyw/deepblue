class MissionsExecuteJob < ActiveJob::Base
  queue_as :default

  def perform(mission,*args)
    @bcv = BcvService.new
    result = @bcv.exec_mission(mission,args)
    p result
  end
end
