class PostsController < ApplicationController
  def show
    @post = load_post_from_url
  end

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
