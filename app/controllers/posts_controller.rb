class PostsController < ApplicationController
  def index
    @posts = Post.all
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
