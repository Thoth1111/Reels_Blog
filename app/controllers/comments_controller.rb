class CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      redirect_to user_post_comments_path(current_user, @comment.post_id)
    else
      render :create
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
