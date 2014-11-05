class CategoriesController < ApplicationController
  skip_before_action :require_admin, only: [:new, :create]

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to region_path(params[:region_id])
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    redirect_to region_path(params[:region_id])
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
