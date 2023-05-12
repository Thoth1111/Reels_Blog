class CommentsController < ApplicationController
    def create
        @comment = Comment.new(params.require(:comment).permit(:text))
        @comment.post_id = params[:post_id]
        if @comment.save
            flash[:success] = "comment added"
            redirect_to user_posts_path(current_user, @comment.post)
        else
            flash.now[:error] = "Error adding comment"
            render :create
        end
    end
end