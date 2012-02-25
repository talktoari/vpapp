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

end

