module Api
  module V1
      class PostsController < ApplicationController

          def index
              @posts = Post.all
              render json: @posts
          end
      end
  end
end
