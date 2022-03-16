class ComicsController < ApplicationController

  before_action :correct_user, only: [:edit, :update]

  def show
    @comic = Comic.find(params[:id])
    @user = @comic.user
    @newcomic = Comic.new
    @comic_comment = ComicComment.new
    @comments = @comic.comic_comments
  end
  def index
    #@comics = Comic.all
    @comic = Comic.new
    #@comics = Comic.page(params[:page]).reverse_order
    @comics = Comic.includes(:favorites_users).sort {|a,b| b.favorites_users.size <=> a.favorites_users.size}
   # binding.pry
   # @comics.page(params[:page]).reverse_order

  end
  def create
    @comic = Comic.new(comic_params)
    @comic.user_id = current_user.id
    if @comic.save
      redirect_to comic_path(@comic), notice: "You have created book successfully."
    else
      @comics = Comic.page(params[:page]).reverse_order
      render 'index'
    end
  end
  def edit
    @comic = Comic.find(params[:id])
    redirect_to comics_path unless current_user.id == @comic.user_id
  end
  def update
    @comic = Comic.find(params[:id])
    if @comic.update(comic_params)
      redirect_to comic_path(@comic), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @comic = Comic.find(params[:id])
    @comic.destroy
    redirect_to comics_path
  end

  private

  def comic_params
    params.require(:comic).permit(:title, :body, :genre, :author)
  end

  def correct_user
    @comic = Comic.find(params[:id])
    redirect_to(comics_path) unless @comic.user == current_user
  end
end