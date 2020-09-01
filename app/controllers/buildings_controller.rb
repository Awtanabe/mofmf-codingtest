class BuildingsController < ApplicationController
  before_action :set_building, only: %w[show edit update destroy]

  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
    @building.stations.build
  end

  def show
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to root_path
    else
      redirect_to :new      
    end
  end

  def edit
  end

  def update
    if @building.update(building_params)
      redirect_to root_path
    else
      redirect_to :edit
    end
  end

  def destroy
    @building.destroy
    redirect_to root_path
  end

  private

  def building_params
    params.require(:building).permit(:name, :rent, :address, :age, :remarks, stations_attributes: [:id, :name, :route_name,:minutes_walk, :_destroy])
  end

  def set_building
    @building = Building.find(params[:id])
  end
end
