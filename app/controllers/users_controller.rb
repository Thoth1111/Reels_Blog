class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    set_user
  end

  private

  def set_user
    @user = User.find(params[:id])
    @showcurrentuser = current_user
  end
end
