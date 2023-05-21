module Api
  module V1
    class PostsController < ApplicationController
      load_and_authorize_resource

      def index
        @posts = Post.all
        render json: @posts
      end

      def create
        @post = Post.new(post_params)
        @post.user_id = current_user.index
        if @post.save
          render json: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @post = Post.find(params[:id])
        @post.destroy
        if @post.destroy
          head :no_content, status: :ok
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      private

      def post_params
        params.require(:post).permit(:title, :text)
      end
    end
  end
end
