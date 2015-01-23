class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @menus = Menu.roots
    respond_with(@menus)
  end

  def show
    redirect_to menus_path
  end

  def new
    if params[:id] && Menu.find(params[:id])
      @menu = Menu.find(params[:id]).children.new
    else
      @menu = Menu.new
    end
    respond_with(@menu)
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menus_path
    else
      render 'new'
    end
  end

  def update
    if @menu.update(menu_params)
      redirect_to menus_path
    else
      render 'new'
    end
  end

  def destroy
    @menu.destroy
    respond_with(@menu)
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:title, :icon, :url, :parent_id)
    end
end
