module Api
    module V1
        class UsersController < ApplicationController
            load_and_authorize_resource

            def index
                @users = User.all
                render json: @users
            end

            def create
                @user = User.new(user_params)
                if @user.save
                    render json: @user, status: :created
                else
                    render json: @user.errors, status: :unprocessable_entity
                end
            end

            def destroy
                @user = User.find(params[:id])
                @user.destroy
                if @user.destroy
                    render json: @user, status: :deleted
                else
                    render json: @user.errors, status: :unprocessable_entity
                end
            end

            private

            def user_params
                params.require(:user).permit(:name, :email, :password, :password_confirmation)
            end
        end
    end
end
