class PostsController < ApplicationController
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
