class RegionsController < ApplicationController
  skip_before_action :require_admin, only: [:index, :show]

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

  def show
    @region = load_region_from_url
    @categories = @region.categories
  end

  def edit
    @region = load_region_from_url
  end

  def update
    region = load_region_from_url
    if region.update(region_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    region = load_region_from_url
    region.destroy

    redirect_to root_path
  end

  private

  def load_region_from_url
    Region.find(params[:id])
  end

  def region_params
    params.require(:region).permit(:name)
  end
end
