class AssetsController < ApplicationController
  before_action :set_asset, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @assets = current_user.assets.paginate(:page => params[:page], :per_page => 13).order('created_at DESC')
    respond_with(@assets)
  end

  def show
    respond_with(@asset)
  end

  def new
    @asset = current_user.assets.new
    respond_with(@asset)
  end

  def edit
  end

  def create
    @asset = current_user.assets.build(asset_params)
    if @asset.save
      redirect_to assets_path, flash: { notice: "文件上传成功!"}
    else
      render 'new'
    end
  end

  def update
    @asset.update(asset_params)
    respond_with(@asset)
  end

  def destroy
    @asset.destroy
    respond_with(@asset)
  end

  def download
    asset = current_user.assets.find(params[:id])
    if asset
      send_file asset.attachment.path, :type => asset.attachment_content_type
    else
      redirect_to assets_path, flash: {danger: "很抱歉您没有权限下载该文件."}
    end
  end
  private
    def set_asset
      @asset = current_user.assets.find(params[:id])
    end

    def asset_params
      params.require(:asset).permit(:user_id, :attachment)
    end
end
