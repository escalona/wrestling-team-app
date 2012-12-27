class WrestlersController < ApplicationController
  helper_method :sort_column, :sort_direction, :match_sort_column
  http_basic_authenticate_with :name => "demo", :password => "demo"

  def index
    # search logic
    if params[:search]
      @tourny = Wrestler.find :all, :joins => :matches, :conditions => ['matches.tournament LIKE ?', "%#{params[:search].downcase}%"]
      @wrestler_name = Wrestler.find :all, :conditions => ['wrestlers.last_name LIKE ?', "%#{params[:search].downcase}%"]
    else
       @wrestlers = Wrestler.includes(:matches).order(sort_column + ' ' + sort_direction)
    end
    # @match_wins = Wrestler.joins(:matches).where(:matches => {:result => 'win'})
    # @match_loses = Wrestler.joins(:matches).where(:matches => {:result => 'lose'})

    respond_to do |format|
      format.html # show default view
      format.json { render :json => @wrestlers }
    end
  end

  def create
    @wrestler = Wrestler.new(params[:wrestler])

    respond_to do |format|
      if @wrestler.save
        format.html {
          redirect_to wrestlers_path
          flash[:success] = "Wrester was successfully created."
        }
        format.json { render :json => @wrestler }
      else
        format.html { render :action => "new" }
        format.json { render :json => @wrestler.errors, :status => :unprocessable_entity }
      end
    end
  end

  def new
    @wrestler = Wrestler.new
    @height_input = [["4 ft 0 in", 48], ["4 ft 1 in", 49], ["4 ft 2 in", 50], ["4 ft 3 in", 51], ["4 ft 4 in", 52], ["4 ft 5 in", 53], ["4 ft 6 in", 54], ["4 ft 7 in", 55], ["4 ft 8 in", 56], ["4 ft 9 in", 57], ["4 ft 10 in", 58], ["4 ft 11 in", 59], ["5 ft 0 in", 60], ["5 ft 1 in", 61], ["5 ft 2 in", 62], ["5 ft 3 in", 63], ["5 ft 4 in", 64], ["5 ft 5 in", 65], ["5 ft 6 in", 66], ["5 ft 7 in", 67], ["5 ft 8 in", 68], ["5 ft 9 in", 69], ["5 ft 10 in", 71], ["5 ft 11 in", 71], ["6 ft 0 in", 72], ["6 ft 1 in", 73], ["6 ft 2 in", 74], ["6 ft 3 in", 75], ["6 ft 4 in", 76], ["6 ft 5 in", 77], ["6 ft 6 in", 78], ["6 ft 7 in", 79], ["6 ft 8 in", 80], ["6 ft 9 in", 81], ["6 ft 10 in", 82], ["6 ft 11 in", 83]]
    @graduating_year = [[2013, 2013], [2014, 2014], [2015, 2015], [2016, 2016], [2017, 2017], [2018,2018], [2019, 2019], [2020, 2020]]
  end

  def show
    @wrestler = Wrestler.find(params[:id])
  end

  def edit
    @wrestler = Wrestler.find(params[:id])
    @height_input = [["4 ft 0 in", 48], ["4 ft 1 in", 49], ["4 ft 2 in", 50], ["4 ft 3 in", 51], ["4 ft 4 in", 52], ["4 ft 5 in", 53], ["4 ft 6 in", 54], ["4 ft 7 in", 55], ["4 ft 8 in", 56], ["4 ft 9 in", 57], ["4 ft 10 in", 58], ["4 ft 11 in", 59], ["5 ft 0 in", 60], ["5 ft 1 in", 61], ["5 ft 2 in", 62], ["5 ft 3 in", 63], ["5 ft 4 in", 64], ["5 ft 5 in", 65], ["5 ft 6 in", 66], ["5 ft 7 in", 67], ["5 ft 8 in", 68], ["5 ft 9 in", 69], ["5 ft 10 in", 71], ["5 ft 11 in", 71], ["6 ft 0 in", 72], ["6 ft 1 in", 73], ["6 ft 2 in", 74], ["6 ft 3 in", 75], ["6 ft 4 in", 76], ["6 ft 5 in", 77], ["6 ft 6 in", 78], ["6 ft 7 in", 79], ["6 ft 8 in", 80], ["6 ft 9 in", 81], ["6 ft 10 in", 82], ["6 ft 11 in", 83]]
    @graduating_year = [[2013, 2013], [2014, 2014], [2015, 2015], [2016, 2016], [2017, 2017], [2018,2018], [2019, 2019], [2020, 2020]]
  end

  def update
    @wrestler = Wrestler.find(params[:id])

    respond_to do |format|
      if @wrestler.update_attributes(params[:wrestler])
        format.html {
          redirect_to @wrestler
          flash[:success] = 'Wrestler was successfully updated.' }
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
      format.html {
        redirect_to wrestlers_url
        flash[:error] = "Wrestler has been deleted."
      }
      format.json { head :no_content}
    end

    def search
      q = params[:wrestler][:first_name]
      @wrestlers = Wrestler.find(:all, :conditions => ["name LIKE %?%", q])
    end
  end

  private

  def sort_column
    Wrestler.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
  end

  def match_sort_column
    Match.column_names.include?(params[:sort]) ? params[:sort] : "match_date"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
