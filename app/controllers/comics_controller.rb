class ComicsController < ApplicationController
    def index
    @comic =Comic.all
    end
end