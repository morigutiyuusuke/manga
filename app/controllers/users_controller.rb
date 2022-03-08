class UsersController < ApplicationController
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
        if @user.update(user_params)
        redirect_to user_path(@user), notice: "You have updated user successfully."
        else
        render "edit"
        end
    end
    
    def user_params
        params.require(:user).permit(:name, :introduction, :profile_image)
    end
end
