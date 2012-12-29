class SearchController < ApplicationController
  def index
    @wrestlers = Wrestler.search(params[:q])
    @matches = Match.search(params[:q])
  end
end
