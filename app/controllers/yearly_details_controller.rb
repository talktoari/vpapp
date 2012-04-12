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
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end

  # Upload and Validate Yearly Details from Excel File
  # for specific student
  def upload_validate_yeardata
    yearly_detail_file = params[:excel_file]
    cur_student_id = params[:student_id]
    file = ExcelUploader.new
    file.store!(yearly_detail_file)
    book = Spreadsheet.open "#{file.store_path}"
    sheet1 = book.worksheet 0
    @yearly_details = []
    @errors = Hash.new
    @counter = 0

    sheet1.each 1 do |row|
      @counter+=1
      cur_yearly_detail = YearlyDetail.new
      
      # Populate the Student ID
      cur_yearly_detail.student_id = cur_student_id
      
      # Populate Fields
      cur_yearly_detail.year = row[0]
      cur_yearly_detail.profession_type = row[1]
      cur_yearly_detail.coll_full_address = row[2]
      cur_yearly_detail.coll_primary_phone = row[3]
      cur_yearly_detail.course = row[4]
      cur_yearly_detail.stream = row[5]
      cur_yearly_detail.amount_fees = row[6]
      cur_yearly_detail.amount_bus_pass = row[7]
      cur_yearly_detail.amount_add_on = row[8]
      cur_yearly_detail.amount_total = row[9]
      cur_yearly_detail.chalan_number = row[10]
      cur_yearly_detail.vr_number = row[11]
      # Books Given Condition
      if row[12] == "Yes"
      	cur_yearly_detail.books_given = true
      else
      	cur_yearly_detail.books_given = false
      end
      
      # Camp Invited Condition
      if row[13] == "Y"
        cur_yearly_detail.camp_invited = true
      else
        cur_yearly_detail.camp_invited = false
      end
      # Camp Attended Condition
      if row[14] == "Y"
        cur_yearly_detail.camp_attended = true
      else
        cur_yearly_detail.camp_attended = false
      end
      cur_yearly_detail.camp_date = row[15]
      cur_yearly_detail.camp_place = row[16]
      cur_yearly_detail.fac_full_address = row[17]
      
      # Letters Sent conditions    
      if (row[18].to_i == "1".to_i)
      	cur_yearly_detail.letter1_sent = true
      	cur_yearly_detail.letter2_sent = false
      elsif (row[18].to_i == "2".to_i)
      	cur_yearly_detail.letter1_sent = true
      	cur_yearly_detail.letter2_sent = true
      elsif (row[18].to_i == "3".to_i)
        cur_yearly_detail.letter1_sent = true
        cur_yearly_detail.letter2_sent = true
      else
      	cur_yearly_detail.letter1_sent = false
      	cur_yearly_detail.letter2_sent = false
      end      
      cur_yearly_detail.comments = row[19]
      
      if cur_yearly_detail.valid?
        @yearly_details << cur_yearly_detail
        # Save the data to DB on success validation for each entry
        cur_yearly_detail.save
      else
        @errors["#{@counter+1}"] = cur_yearly_detail.errors
      end
    end
    file.remove!
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

