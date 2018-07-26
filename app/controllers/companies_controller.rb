class CompaniesController < ApplicationController
    # before_action :set_company, only: [:show]

  def new
    @company = Company.new
    render :new
  end

  def create
    @company = Company.new(company_params)
    @office = Office.new(company: @company, building: Building.find(params[:office][:building_id]), floor: 1)

    # @buildings = Building.all
    # Office.create(company: @company, building:  )
    if @company.save && @office.save
      # flash[:notice]
      redirect_to buildings_path
    else
      render :new
    end
  end


  private
  def company_params
    params.require(:company).permit(:name, :buildings)
  end

  # def set_company
  #   @company = Company.find(params[:id])
  # end

end
