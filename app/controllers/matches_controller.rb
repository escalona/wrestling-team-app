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
      flash[:notice] = 'Successfully updated match'
      redirect_to wrestler_path(@wrestler)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @wrestler = Wrestler.find(params[:wrestler_id])
    @match = @wrestler.matches.find(params[:id])
    @match.destroy
    flash[:notice] = 'Successfully destroyed match'
    redirect_to wrestler_path(@wrestler)
  end
end
