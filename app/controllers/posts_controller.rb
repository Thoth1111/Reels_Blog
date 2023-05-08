class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def show
        set_post
    end

    private

    def set_post
        @post = Post.find(params[:id])
    end
end
    