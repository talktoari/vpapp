class StudentAreaTypesController < ApplicationController
  # GET /student_area_types
  # GET /student_area_types.json
  def index
    @student_area_types = StudentAreaType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_area_types }
    end
  end

  # GET /student_area_types/1
  # GET /student_area_types/1.json
  def show
    @student_area_type = StudentAreaType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_area_type }
    end
  end

  # GET /student_area_types/new
  # GET /student_area_types/new.json
  def new
    @student_area_type = StudentAreaType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_area_type }
    end
  end

  # GET /student_area_types/1/edit
  def edit
    @student_area_type = StudentAreaType.find(params[:id])
  end

  # POST /student_area_types
  # POST /student_area_types.json
  def create
    @student_area_type = StudentAreaType.new(params[:student_area_type])

    respond_to do |format|
      if @student_area_type.save
        format.html { redirect_to @student_area_type, notice: 'Student area type was successfully created.' }
        format.json { render json: @student_area_type, status: :created, location: @student_area_type }
      else
        format.html { render action: "new" }
        format.json { render json: @student_area_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_area_types/1
  # PUT /student_area_types/1.json
  def update
    @student_area_type = StudentAreaType.find(params[:id])

    respond_to do |format|
      if @student_area_type.update_attributes(params[:student_area_type])
        format.html { redirect_to @student_area_type, notice: 'Student area type was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_area_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_area_types/1
  # DELETE /student_area_types/1.json
  def destroy
    @student_area_type = StudentAreaType.find(params[:id])
    @student_area_type.destroy

    respond_to do |format|
      format.html { redirect_to student_area_types_url }
      format.json { head :ok }
    end
  end
end
