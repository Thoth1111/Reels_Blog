module Api
  module V1
    class CommentsController < ApplicationController
      load_and_authorize_resource

      def index
        @post = Post.find(params[:post_id])
        @user = User.find(params[:user_id])
        @comments = @post.comments
        render json: @comments
      end

      def create
        @comment = current_user.comments.new(comment_params)
        @comment.post_id = params[:post_id]
        if @comment.save
          render json: @comment, status: :created
        else
          render json: @comment.errors, status: :unprocessable_entity
        end

        render json: { error: 'Invalid token' }, status: :unprocessable_entity
      end

      private

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
