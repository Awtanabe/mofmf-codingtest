class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
    @building.stations.build
  end

  def show
    @building = Building.find(params[:id])    
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
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])

    if @building.update(building_params)
      redirect_to root_path
    else
      redirect_to :edit
    end
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    redirect_to root_path
  end

  private

  def building_params
    params.require(:building).permit(:name, :rent, :address, :age, :remarks, stations_attributes: [:id, :name, :route_name,:minutes_walk, :_destroy])
  end
end
