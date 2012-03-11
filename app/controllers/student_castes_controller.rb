class StudentCastesController < ApplicationController
  # GET /student_castes
  # GET /student_castes.json
  def index
    @student_castes = StudentCaste.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_castes }
    end
  end

  # GET /student_castes/1
  # GET /student_castes/1.json
  def show
    @student_caste = StudentCaste.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_caste }
    end
  end

  # GET /student_castes/new
  # GET /student_castes/new.json
  def new
    @student_caste = StudentCaste.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_caste }
    end
  end

  # GET /student_castes/1/edit
  def edit
    @student_caste = StudentCaste.find(params[:id])
  end

  # POST /student_castes
  # POST /student_castes.json
  def create
    @student_caste = StudentCaste.new(params[:student_caste])

    respond_to do |format|
      if @student_caste.save
        format.html { redirect_to @student_caste, notice: 'Student caste was successfully created.' }
        format.json { render json: @student_caste, status: :created, location: @student_caste }
      else
        format.html { render action: "new" }
        format.json { render json: @student_caste.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_castes/1
  # PUT /student_castes/1.json
  def update
    @student_caste = StudentCaste.find(params[:id])

    respond_to do |format|
      if @student_caste.update_attributes(params[:student_caste])
        format.html { redirect_to @student_caste, notice: 'Student caste was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_caste.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_castes/1
  # DELETE /student_castes/1.json
  def destroy
    @student_caste = StudentCaste.find(params[:id])
    @student_caste.destroy

    respond_to do |format|
      format.html { redirect_to student_castes_url }
      format.json { head :ok }
    end
  end
end
