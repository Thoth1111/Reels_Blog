class PostsController < ApplicationController
  def index
    @posts = Kaminari.paginate_array(Post.all).page(params[:page]).per(5)
    @user = User.find(params[:user_id])
  end

  def show
    set_post
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
