module Api
    module V1
        class LikesController < ApplicationController
            load_and_authorize_resource

            def index
                @post = Post.find(params[:post_id])
                @user = User.finc(params[:user_id])
                @likes = @post.likes
                render json: @likes
            end

            def create
                @like = current_user.likes.new
                @like.post_id = params[:post_id]
                if @like.save
                    render json: @like, status: :liked
                else
                    render json: @like.errors, status: :unprocessable_entity
                end
            end

            def destroy
                @like = like.find(params[:id])
                @like.destroy
                if @like.destroy
                    render json: @like, status: :unliked
                else
                    render json: @like.errors, status: :unprocessable_entity
                end
            end
        end
    end
end