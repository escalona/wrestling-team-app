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
end
