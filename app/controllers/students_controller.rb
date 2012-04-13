class StudentsController < ApplicationController
  # CanCan Specific Authorization. Doesn't need instance variables
  # See all first line for actions commented except index
  load_and_authorize_resource
  before_filter :authenticate_user!

  # GET /students
  # GET /students.json
  def index
  # @students = Student.all
    @students = Student.order(:created_at).page params[:page]
    @all_students = Student.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
      format.xls {
              send_data @all_students.to_xls(:name => "Students",
              # :columns => [:name, :address, :age],
              # :headers => ['NAME', 'ADDRESS', 'AGE'],
              :cell_format => {:color => :blue},
              :header_format => {:weight => :bold, :color => :red}),
              :filename => 'All_Students.xls' }
    end
  end

  # GET /students/1
  # GET /students/1.json
  def show
  # @student = Student.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/new
  # GET /students/new.json
  def new
  # @student = Student.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student }
    end
  end

  # GET /students/1/edit
  def edit
  # @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.json
  def create
  # @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: @student, status: :created, location: @student }
      else
        format.html { render action: "new" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
  # @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
  # @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :ok }
    end
  end

  # Upload and Validate Students from Excel File
  def upload_validate_student
    student_file = params[:excel_file]
    file = ExcelUploader.new
    file.store!(student_file)
    book = Spreadsheet.open "#{file.store_path}"
    sheet1 = book.worksheet 0
    @students = []
    @errors = Hash.new
    @counter = 0

    sheet1.each 1 do |row|
      @counter+=1
      cur_student = Student.new
      # Populate Fields
      cur_student.ser_no = row[0]
      cur_student.district = row[1]
      cur_student.taluka = row[2]
      cur_student.vp_id = row[3]
      cur_student.first_name = row[4]
      cur_student.father_name = row[5]
      cur_student.pmt_full_address = row[6]
      cur_student.cur_full_address = row[7]
      cur_student.primary_phone = row[8]
      cur_student.additional_phone = row[9]
      cur_student.father_occupation = row[10]
      cur_student.mother_occupation = row[11]
      cur_student.total_family_income = row[12]
      # Gender format changes
      if ((row[13] == "B") || (row[13] == "Boy") || (row[13] == "M") || (row[13] == "Male"))
        cur_student.gender = "Boy"
      elsif ((row[13] == "G") || (row[13] == "Girl") || (row[13] == "F") || (row[13] == "Female"))
        cur_student.gender = "Girl"
      else
        cur_student.gender = row[13]
      end
      
      # AreaType format changes
      if ((row[14] == "R") || (row[14] == "Rural"))
        cur_student.area_type = "Rural"
      elsif ((row[14] == "U") || (row[14] == "Urban"))
        cur_student.area_type = "Urban"
      else
        cur_student.area_type = row[14]
      end
      
      cur_student.caste = row[15]
      cur_student.studied_medium = row[16]
      cur_student.cet_rank = row[17]
      cur_student.sslc_percentage = row[18]
      cur_student.exam_ticket_number = row[19]
      cur_student.account_number = row[20]
      cur_student.atm_number = row[21]
      cur_student.house_visited_by = row[22]
      cur_student.last_year_donor = row[23]
      cur_student.present_year_donor = row[24]
      cur_student.comments = row[25]
			# For passing validations
			cur_student.last_name = "."
			
			# Check validity
      if cur_student.valid?
        @students << cur_student
        # Save the data to DB on success validation for each entry
        cur_student.save
      else
        @errors["#{@counter+1}"] = cur_student.errors
      end
    end
    file.remove!
  end


  # Search and Find relevant records based on query
  # Implemented using ransack gem
  # Before calling the form page, new object of Ransack::Search
  # for specific model needs to be created
  def search
    @search = Ransack::Search.new(Student)
  end

  # Search Results
  def search_results
    @search = Student.search(params[:q])
    @students = @search.result(:distinct => true)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @students }
      format.xls {
              send_data @students.to_xls(:name => "Found_Students",
              # :columns => [:name, :address, :age],
              # :headers => ['NAME', 'ADDRESS', 'AGE'],
              :cell_format => {:color => :blue},
              :header_format => {:weight => :bold, :color => :red}),
              :filename => 'Found_Students.xls' }
    end
  end

end

