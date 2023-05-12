class PostsController < ApplicationController
  def index
    @posts = Kaminari.paginate_array(Post.all).page(params[:page]).per(5)
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(params.require(:post).permit(:title, :text))
    if @post.save
      flash[:success] = "Post created successfully"
      redirect_to user_posts_path(current_user, @post)
    else
      flash.now[:error] = "Error creating post"
      render :new
    end
  end

  def show
    set_post
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
