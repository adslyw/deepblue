class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @missions = Mission.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')
    respond_with(@missions)
  end

  def show
    respond_with(@mission)
  end

  def new
    @mission = Mission.new
    respond_with(@mission)
  end

  def edit
  end

  def create
    @mission = Mission.new(mission_params)
    @mission.save
    respond_with(@mission)
  end

  def update
    @mission.update(mission_params)
    respond_with(@mission)
  end

  def destroy
    @mission.destroy
    respond_with(@mission)
  end

  private
    def set_mission
      @mission = Mission.find(params[:id])
    end

    def mission_params
      params.require(:mission).permit(:description, :sql, :params, :sql_type, :multiple)
    end
end
