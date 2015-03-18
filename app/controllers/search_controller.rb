class SearchController < ApplicationController
  def index
    @missions = Mission.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
  end
  def task
    begin
      @mission = Mission.find(params[:id])
    rescue
      redirect_to '/search'
    end
    if params[:method] == 'post'
      begin
        @bcv = BcvService.new
        params_needed = []
        if @mission.has_params?
          @mission.params.split(',').map{|param| params_needed << params[param.to_sym]}
        end
        @result = @bcv.exec_mission @mission, params_needed
      rescue
        @result = nil
      end
    end
  end
end
