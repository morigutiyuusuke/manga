class SearchesController < ApplicationController
    before_action :authenticate_user!

    def search
      @model=params[:model]
      @content=params[:content]
      @method=params[:method]
      if @model == 'user'
        @records=User.search_for(@content,@method)
      elsif @model=='comic'
        @records=Comic.search_for(@content,@method)
      else
        @records = Comic.where(genre: @content)
      end
    end
end
