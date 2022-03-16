class UsersController < ApplicationController
    before_action :ensure_correct_user, only: [:edit, :update]
    def show
        @comic = Comic.new
        @user = User.find(params[:id])
        @comics = @user.comics
    end
    def index
         @comic = Comic.new
         @users = User.all
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
        redirect_to user_path(@user), notice: "You have updated user successfully."
        else
        render "edit"
        end
    end

    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end
    def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
    end
end
