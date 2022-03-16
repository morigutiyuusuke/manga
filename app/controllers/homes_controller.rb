class HomesController < ApplicationController
  def top
    #["選択して下さい"], ["少年"], ["少女"],  ["青年"], ["女性"],["BL"]]
    @comics1 = Comic.where(genre: '少年')
    @comics2 = Comic.where(genre: '少女')
  end
  def about
  end
end
