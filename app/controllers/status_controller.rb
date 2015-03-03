class StatusController < ApplicationController
  def index
    begin
      @bcv = BcvService.new
      @mission = Mission.find(1)
      @result = @bcv.process(@mission.to_hash)
      @status = OpenStruct.new
      @status.updated = true
      @status.dblink_exist = !@result.empty?
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
