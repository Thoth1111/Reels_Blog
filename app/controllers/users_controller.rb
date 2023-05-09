class UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html { render :index }
    end
  end

  def show
    set_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
