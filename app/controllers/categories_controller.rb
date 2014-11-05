class CategoriesController < ApplicationController
  skip_before_action :require_admin, only: [:show]

  def new
    @region = load_region_from_url
    @category = @region.categories.new
  end

  def create
    region = load_region_from_url
    category = region.categories.new(category_params)
    if category.save
      redirect_to region
    else
      render :new
    end
  end

  def show
    @region = load_region_from_url
    @category = load_category_from_url
    @posts = @category.posts
  end

  def edit
    @region = load_region_from_url
    @category = load_category_from_url
  end

  def update
    region = load_region_from_url
    category = load_category_from_url

    if category.update(category_params)
      redirect_to region
    else
      render :edit
    end
  end

  def destroy
    region = load_region_from_url
    category = load_category_from_url
    category.destroy

    redirect_to region
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def load_region_from_url
    Region.find(params[:region_id])
  end

  def load_category_from_url
    region = load_region_from_url
    region.categories.find(params[:id])
  end
end
