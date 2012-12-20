class MatchesController < ApplicationController
  def index
    @matches = Match.all

    respond_to do |format|
      format.html
      format.json { render :json => @matches}
    end
  end

  def create

  end

  def new

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
