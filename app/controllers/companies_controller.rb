class CompaniesController < ApplicationController
    # before_action :set_company, only: [:show]

  def new
    @company = Company.new
    render :new
  end

  def create
    @company = Company.new(company_params)
    byebug
    # @buildings = Building.all
    # Office.create(company: @company, building:  )
    if @company.save
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
