class StudentDistrictsController < ApplicationController
  # CanCan Specific Authorization. Doesn't need instance variables
  # See all first line for actions commented except index
  load_and_authorize_resource
  before_filter :authenticate_user!

  # GET /student_districts
  # GET /student_districts.json
  def index
  #  @student_districts = StudentDistrict.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_districts }
    end
  end

  # GET /student_districts/1
  # GET /student_districts/1.json
  def show
  #  @student_district = StudentDistrict.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_district }
    end
  end

  # GET /student_districts/new
  # GET /student_districts/new.json
  def new
  #  @student_district = StudentDistrict.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_district }
    end
  end

  # GET /student_districts/1/edit
  def edit
  #  @student_district = StudentDistrict.find(params[:id])
  end

  # POST /student_districts
  # POST /student_districts.json
  def create
  #  @student_district = StudentDistrict.new(params[:student_district])

    respond_to do |format|
      if @student_district.save
        format.html { redirect_to @student_district, notice: 'Student district was successfully created.' }
        format.json { render json: @student_district, status: :created, location: @student_district }
      else
        format.html { render action: "new" }
        format.json { render json: @student_district.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_districts/1
  # PUT /student_districts/1.json
  def update
  #  @student_district = StudentDistrict.find(params[:id])

    respond_to do |format|
      if @student_district.update_attributes(params[:student_district])
        format.html { redirect_to @student_district, notice: 'Student district was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_district.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_districts/1
  # DELETE /student_districts/1.json
  def destroy
  #  @student_district = StudentDistrict.find(params[:id])
    @student_district.destroy

    respond_to do |format|
      format.html { redirect_to student_districts_url }
      format.json { head :ok }
    end
  end
end

