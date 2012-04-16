class YearlyDetailYearsController < ApplicationController
  # CanCan Specific Authorization. Doesn't need instance variables
  # See all first line for actions commented except index
  load_and_authorize_resource
  before_filter :authenticate_user!

  # GET /yearly_detail_years
  # GET /yearly_detail_years.json
  def index
  #  @yearly_detail_years = YearlyDetailYear.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yearly_detail_years }
    end
  end

  # GET /yearly_detail_years/1
  # GET /yearly_detail_years/1.json
  def show
  #  @yearly_detail_year = YearlyDetailYear.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yearly_detail_year }
    end
  end

  # GET /yearly_detail_years/new
  # GET /yearly_detail_years/new.json
  def new
  #  @yearly_detail_year = YearlyDetailYear.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yearly_detail_year }
    end
  end

  # GET /yearly_detail_years/1/edit
  def edit
  #  @yearly_detail_year = YearlyDetailYear.find(params[:id])
  end

  # POST /yearly_detail_years
  # POST /yearly_detail_years.json
  def create
  #  @yearly_detail_year = YearlyDetailYear.new(params[:yearly_detail_year])

    respond_to do |format|
      if @yearly_detail_year.save
        format.html { redirect_to @yearly_detail_year, notice: 'Yearly detail year was successfully created.' }
        format.json { render json: @yearly_detail_year, status: :created, location: @yearly_detail_year }
      else
        format.html { render action: "new" }
        format.json { render json: @yearly_detail_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /yearly_detail_years/1
  # PUT /yearly_detail_years/1.json
  def update
  #  @yearly_detail_year = YearlyDetailYear.find(params[:id])

    respond_to do |format|
      if @yearly_detail_year.update_attributes(params[:yearly_detail_year])
        format.html { redirect_to @yearly_detail_year, notice: 'Yearly detail year was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @yearly_detail_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yearly_detail_years/1
  # DELETE /yearly_detail_years/1.json
  def destroy
  #  @yearly_detail_year = YearlyDetailYear.find(params[:id])
    @yearly_detail_year.destroy

    respond_to do |format|
      format.html { redirect_to yearly_detail_years_url }
      format.json { head :ok }
    end
  end
end

