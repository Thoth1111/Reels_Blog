class UsersController < ApplicationController
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  def index
    @users = User.all
  end

  def show
    set_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
