class YearlyDetailsController < ApplicationController
  # CanCan Specific Authorization. Doesn't need instance variables
  # See all first line for actions commented except index
  load_and_authorize_resource
  before_filter :authenticate_user!

  # GET /yearly_details
  # GET /yearly_details.json
  def index
  # @yearly_details = YearlyDetail.all
    @yearly_details = YearlyDetail.order(:created_at).page params[:page]
    @all_yearly_details = YearlyDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yearly_details }
      format.xls {
              send_data @all_yearly_details.to_xls(:name => "All_Yearly_Details",
              # :columns => [:name, :address, :age],
              # :headers => ['NAME', 'ADDRESS', 'AGE'],
              :cell_format => {:color => :blue},
              :header_format => {:weight => :bold, :color => :red}),
              :filename => 'All_Yearly_Details.xls' }
    end
  end

  # GET /yearly_details/1
  # GET /yearly_details/1.json
  def show
  #  @yearly_detail = YearlyDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yearly_detail }
    end
  end

  # GET /yearly_details/new
  # GET /yearly_details/new.json
  def new
  #  @yearly_detail = YearlyDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yearly_detail }
    end
  end

  # GET /yearly_details/1/edit
  def edit
  #  @yearly_detail = YearlyDetail.find(params[:id])
  end

  # POST /yearly_details
  # POST /yearly_details.json
  def create
  #  @yearly_detail = YearlyDetail.new(params[:yearly_detail])

    respond_to do |format|
      if @yearly_detail.save
        # Find the donor to redirect to donor show page
        @student = Student.find(@yearly_detail.student_id)
        format.html { redirect_to student_path(@student), notice: 'Yearly detail was successfully created.' }
        format.json { render json: @yearly_detail, status: :created, location: @yearly_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @yearly_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /yearly_details/1
  # PUT /yearly_details/1.json
  def update
  #  @yearly_detail = YearlyDetail.find(params[:id])

    respond_to do |format|
      if @yearly_detail.update_attributes(params[:yearly_detail])
        format.html { redirect_to @yearly_detail, notice: 'Yearly detail was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @yearly_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yearly_details/1
  # DELETE /yearly_details/1.json
  def destroy
  #  @yearly_detail = YearlyDetail.find(params[:id])
    @yearly_detail.destroy

    respond_to do |format|
      format.html { redirect_to yearly_details_url }
      format.json { head :ok }
    end
  end

  # Search and Find relevant records based on query
  # Implemented using ransack gem
  # Before calling the form page, new object of Ransack::Search
  # for specific model needs to be created
  def search
    @search = Ransack::Search.new(YearlyDetail)
  end

  # Search Results
  def search_results
    @search = YearlyDetail.search(params[:q])
    @yearly_details = @search.result(:distinct => true)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yearly_details }
      format.xls {
              send_data @yearly_details.to_xls(:name => "Found_Yearly_Details",
              # :columns => [:name, :address, :age],
              # :headers => ['NAME', 'ADDRESS', 'AGE'],
              :cell_format => {:color => :blue},
              :header_format => {:weight => :bold, :color => :red}),
              :filename => 'Found_Yearly_Details.xls' }
    end
  end

end

