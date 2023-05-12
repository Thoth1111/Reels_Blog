class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        @comment.post_id = params[:post_id]

        if @comment.save
            redirect_to user_post_path(current_user, @comment.post)
        else
            render :create
        end
    end

    private
    
    def comment_params
        params.require(:comment).permit(:text)
    end
end