class HomesController < ApplicationController
  def top
    #["選択して下さい"], ["少年"], ["少女"],  ["青年"], ["女性"],["BL"]]
    #@comics1 = Comic.where(genre: '少年')
    #@comics2 = Comic.where(genre: '少女')
    #@comics3 = Comic.where(genre: '青年')
    #@comics4 = Comic.where(genre: '女性')
    #@comics5 = Comic.where(genre: 'BL')
    @ranks = Comic.joins(:favorites).group(:id).order("count(favorites.comic_id) desc").first(5)
  end
  def about
  end
end

