class PostsController < ApplicationController
  def new
    @category = load_category_from_url
    @post = @category.posts.new
  end

  def create
    @category = load_category_from_url
    @post = @category.posts.new(post_params)
    if @post.save
      redirect_to [@category, @post]
    else
      render :new
    end
  end

  def show
    @post = load_post_from_url
  end

  def edit
    @category = load_category_from_url
    @post = load_post_from_url
  end

  def update
    @category = load_category_from_url
    @post = load_post_from_url
    if @post.update(post_params)
      redirect_to [@category, @post]
    else
      render :edit
    end
  end

  def destroy
    category = load_category_from_url
    post = load_post_from_url
    post.destroy

    redirect_to [category.region, category]
  end

  private

  def load_category_from_url
    Category.find(params[:category_id])
  end

  def load_post_from_url
    category = load_category_from_url
    category.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body).merge(user_id: current_user.id)
  end
end
