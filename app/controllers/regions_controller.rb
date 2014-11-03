class RegionsController < ApplicationController
  def index
    @regions = Region.all
  end

  def new
    @region = Region.new
  end

  def create
    region = Region.new(region_params)
    if region.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def region_params
    params.require(:region).permit(:name)
  end
end
