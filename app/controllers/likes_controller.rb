class LikesController < ApplicationController
  def create
    @like = current_user.likes.new
    @like.post_id = params[:post_id]
    if @like.save
      flash[:success] = 'You liked this post'
      redirect_to user_post_path(current_user, @like.post)
    else
      flash.now[:error] = 'like failed'
      render :create
    end
  end
end
