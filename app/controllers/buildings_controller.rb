class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  def index
    @buildings = Building.all
  end

  def edit
    render :edit
  end

  def update
    if @building.update(building_params)
      redirect_to buildings_path
    else
      render :edit
    end
  end

  private

  def building_params
    params.require(:building).permit(:name, :country, :address, :rent_per_floor, :number_of_floors)
  end

  def set_building
    @building = Building.find(params[:id])
  end

end
