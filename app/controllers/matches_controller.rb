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
    redirect_to wrestler_path(@wrestler)

    # respond_to do |format|
    #   if @match.save
    #     format.html { render :action => "create" }
    #     format.json { render :json => @match }
    #   else
    #     format.html { render :action => "new" }
    #     format.json { render :json => @match.errors, :status => unprocessable_entitiy }
    #   end
    # end
  end

  def new
    @match = Match.new
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
