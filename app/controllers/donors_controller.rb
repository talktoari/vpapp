class DonorsController < ApplicationController
  # CanCan Specific Authorization. Doesn't need instance variables
  # See all first line for actions commented except index
  load_and_authorize_resource
  before_filter :authenticate_user!

  # GET /donors
  # GET /donors.json
  def index
  # @donors = Donor.all
    # Paginated Output with Kaminari
    @donors = Donor.order(:created_at).page params[:page]
    @all_donors = Donor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donors }
      format.xls {
              send_data @all_donors.to_xls(:name => "Donors",
              # :columns => [:name, :address, :age],
              # :headers => ['NAME', 'ADDRESS', 'AGE'],
              :cell_format => {:color => :blue},
              :header_format => {:weight => :bold, :color => :red}),
              :filename => 'All_Donors.xls' }
    end
  end

  # GET /donors/1
  # GET /donors/1.json
  def show
  # @donor = Donor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @donor }
    end
  end

  # GET /donors/new
  # GET /donors/new.json
  def new
  # @donor = Donor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @donor }
    end
  end

  # GET /donors/1/edit
  def edit
  # @donor = Donor.find(params[:id])
  end

  # POST /donors
  # POST /donors.json
  def create
  # @donor = Donor.new(params[:donor])

    respond_to do |format|
      if @donor.save
        format.html { redirect_to @donor, notice: 'Donor was successfully created.' }
        format.json { render json: @donor, status: :created, location: @donor }
      else
        format.html { render action: "new" }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /donors/1
  # PUT /donors/1.json
  def update
  # @donor = Donor.find(params[:id])

    respond_to do |format|
      if @donor.update_attributes(params[:donor])
        format.html { redirect_to @donor, notice: 'Donor was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donors/1
  # DELETE /donors/1.json
  def destroy
  # @donor = Donor.find(params[:id])
    @donor.destroy

    respond_to do |format|
      format.html { redirect_to donors_url }
      format.json { head :ok }
    end
  end

  # Upload and Validate Donor from Excel File
  def upload_validate_donor
    donor_file = params[:excel_file]
    file = ExcelUploader.new
    file.store!(donor_file)
    book = Spreadsheet.open "#{file.store_path}"
    sheet1 = book.worksheet 0
    @donors = []
    @errors = Hash.new
    @counter = 0

    sheet1.each 1 do |row|
      @counter+=1
      cur_donor = Donor.new
      # Populate Fields
      cur_donor.ser_no = row[0]
      cur_donor.title = row[1]
      cur_donor.first_name = row[2]

      # Gender format changes
      if ((row[4] == "B") || (row[4] == "Boy") || (row[4] == "M") || (row[4] == "Male"))
        cur_donor.gender = "Boy"
      elsif ((row[4] == "G") || (row[4] == "Girl") || (row[4] == "F") || (row[4] == "Female"))
        cur_donor.gender = "Girl"
      else
        cur_donor.gender = row[4]
      end

      cur_donor.email = row[5]
      cur_donor.address_first_line = row[6]
      cur_donor.address_second_line = row[7]
      cur_donor.address_landmark = row[8]
      cur_donor.district = row[9]
      cur_donor.city = row[10]
      cur_donor.state = row[11]
      cur_donor.country = row[12]
      cur_donor.pincode = row[13]
      cur_donor.phone = row[14]
      cur_donor.mobile = row[15]
      cur_donor.donor_type = row[16]
      cur_donor.comment = row[17]

      cur_donor.last_name = "."

      if cur_donor.valid?
        @donors << cur_donor
        # Save the data to DB on success validation for each entry
        cur_donor.save
      else
        @errors["#{@counter+1}"] = cur_donor.errors
      end
    end
    file.remove!
  end

  # Search and Find relevant records based on query
  # Implemented using ransack gem
  # Before calling the form page, new object of Ransack::Search
  # for specific model needs to be created
  def search
    @search = Ransack::Search.new(Donor)
  end

  # Search Results
  def search_results
    @search = Donor.search(params[:q])
    @donors = @search.result(:distinct => true)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donors }
      format.xls {
              send_data @donors.to_xls(:name => "Found_Donors",
              # :columns => [:name, :address, :age],
              # :headers => ['NAME', 'ADDRESS', 'AGE'],
              :cell_format => {:color => :blue},
              :header_format => {:weight => :bold, :color => :red}),
              :filename => 'Found_Donors.xls' }
    end
  end

end

