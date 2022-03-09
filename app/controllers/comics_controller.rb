class ComicsController < ApplicationController
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
    @comics = Comic.page(params[:page]).reverse_order
  end
  def create
    @comic = Comic.new(comic_params)
    @comic.user_id = current_user.id
    if @comic.save
      redirect_to comic_path(@comic), notice: "You have created book successfully."
    else
      @comic = Comic.all
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
    params.require(:comic).permit(:title, :body)
  end
end