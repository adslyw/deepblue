class StatusController < ApplicationController
  def index
    begin
      @bcv = BcvService.new
      dblink_exist = !@bcv.exec_mission(Mission.find(1)).empty?
      dbupdate_time = @bcv.exec_mission(Mission.find(2)).first.item_value
      @status = OpenStruct.new
      @status.updated = true
      @status.dblink_exist = dblink_exist
      @status.update_time = dbupdate_time
    rescue
      @status = OpenStruct.new
      @status.updated = false
    end
  end
  def mkdblink
    begin
      @bcv = BcvService.new
      @bcv.mkdblink
    rescue
    end
    redirect_to status_path
  end
end
