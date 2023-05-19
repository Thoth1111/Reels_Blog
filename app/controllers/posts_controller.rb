class PostsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).page(params[:page]).per(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      flash[:success] = 'Post created successfully'
      redirect_to user_posts_path(current_user, @post)
    else
      flash.now[:error] = 'Error creating post'
      render :new
    end
  end

  def destroy
    set_post
    if @post.destroy
      flash[:success] = 'Post deleted successfully'
      redirect_to user_posts_path(current_user)
    else
      flash.now[:error] = 'Error deleting post'
      render :show
    end
  end

  def show
    set_post
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
