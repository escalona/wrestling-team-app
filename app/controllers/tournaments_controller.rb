class TournamentsController < ApplicationController
  def index
    @tourny = Wrestler.find :all, :joins => :matches, :conditions => ['matches.tournament LIKE ?', "%#{params[:q]}%"]
  end
end
