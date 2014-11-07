class PostsController < ApplicationController
  def new
    @region = load_region_from_url
    @categories = @region.categories
    @post = @region.posts.new
  end

  def create
    @region = load_region_from_url
    @post = @region.posts.new(post_params)
    if @post.save
      redirect_to [@region, @post]
    else
      render :new
    end
  end

  def show
    @post = load_post_from_url
    @categories = @post.categories
  end

  def edit
    @region = load_region_from_url
    @post = load_post_from_url
  end

  def update
    @region = load_region_from_url
    @post = load_post_from_url
    if @post.update(post_params)
      redirect_to [@region, @post]
    else
      render :edit
    end
  end

  def destroy
    region = load_region_from_url
    post = load_post_from_url
    post.destroy

    redirect_to region
  end

  private

  def load_region_from_url
    Region.find(params[:region_id])
  end

  def load_post_from_url
    region = Region.find(params[:region_id])
    region.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, category_ids: [])
      .merge(user_id: current_user.id)
  end
end
