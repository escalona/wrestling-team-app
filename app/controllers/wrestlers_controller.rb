class WrestlersController < ApplicationController

  def index
    @wrestlers = Wrestler.all

    respond_to do |format|
      format.html # show default view
      format.json { render :json => @wrestlers }
    end
  end

  def create
    @wrestler = Wrestler.new(params[:wrestler])

    respond_to do |format|
      if @wrestler.save
        format.html { render :action => "create" }
        format.json { render :json => @wrestler }
      else
        format.html { render :action => "new" }
        format.json { render :json => @wrestler.errors, :status => unprocessable_entity }
      end
    end
  end

  def new
    @wrestler = Wrestler.new
  end

  def show
    @wrestler = Wrestler.find(params[:id])
    @matches = @wrestler.matches
  end

  def edit
    @wrestler = Wrestler.find(params[:id])
  end

  def update
    @wrestler = Wrestler.find(params[:id])

    respond_to do |format|
      if @wrestler.update_attributes(params[:wrestler])
        format.html { redirect_to @wrestler, :notice => 'Wrestler was successfully updated' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wrestler.errors, :status => :unprocessable_entity}
      end
    end
  end

  def destroy
    @wrestler = Wrestler.find(params[:id])
    @wrestler.destroy

    respond_to do |format|
      format.html { redirect_to wrestlers_url }
      format.json { head :no_content}
    end
  end
end
