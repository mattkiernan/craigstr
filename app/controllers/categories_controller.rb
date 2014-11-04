class CategoriesController < ApplicationController
  skip_before_action :require_admin, only: [:show]

  def new
    @region = Region.find(params[:region_id])
    @category = @region.categories.new
  end

  def create
    @region = Region.find(params[:region_id])
    @category = @region.categories.new(category_params)
    if @category.save
      redirect_to region_path(@region)
    else
      render :new
    end
  end

  def show
    @region = Region.find(params[:region_id])
    @category = @region.categories.find(params[:id])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
