class ComicCommentsController < ApplicationController
  def create
    @comic = Comic.find(params[:comic_id])
    comment = current_user.comic_comments.new(comic_comment_params)
    comment.comic_id = @comic.id
    comment.save
    #redirect_to comic_path(comic)
  end

  def destroy
    @comic = Comic.find(params[:comic_id])
    ComicComment.find_by(id: params[:id], comic_id: params[:comic_id]).destroy
    #redirect_to comic_path(comic)
  end
  private

  def comic_comment_params
    params.require(:comic_comment).permit(:comment)
  end
end
