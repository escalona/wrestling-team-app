class MatchesController < ApplicationController
  def index
    @matches = Match.all

    respond_to do |format|
      format.html
      format.json { render :json => @matches}
    end
  end

  def create
    @wrestler = Wrestler.find(params[:wrestler_id])
    @match = @wrestler.matches.create(params[:match])

    respond_to do |format|
      if @match.save
        format.html {
          redirect_to wrestler_path(@wrestler)
          flash[:success] = "Match was successfully created."
        }
        format.json { render :json => @match }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def new
    @wrestler = Wrestler.find(params[:wrestler_id])
    @match = @wrestler.matches.build
  end

  def show
  end

  def edit
    @wrestler = Wrestler.find(params[:wrestler_id])
    @match = @wrestler.matches.find(params[:id])
  end

  def update
    @wrestler = Wrestler.find(params[:wrestler_id])
    @match = @wrestler.matches.find(params[:id])
    if @match.update_attributes(params[:match])
      flash[:success] = 'Match was successfully updated.'
      redirect_to wrestler_path(@wrestler)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @wrestler = Wrestler.find(params[:wrestler_id])
    @match = @wrestler.matches.find(params[:id])
    @match.destroy
    flash[:error] = 'Match has been deleted.'
    redirect_to wrestler_path(@wrestler)
  end
end
