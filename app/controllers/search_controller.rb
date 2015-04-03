class SearchController < ApplicationController
  respond_to :html, :json, :js
  def index
    @missions = Mission.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end

  def task
    begin
      @mission = Mission.find(params[:id])
    rescue
      redirect_to '/search'
    end

    begin
      @bcv = BcvService.new
      @result = @bcv.exec_mission @mission, params[:input]
    rescue
      @result = nil
    end
  end
end
