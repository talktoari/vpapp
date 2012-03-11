class StudentStudyMedsController < ApplicationController
  # GET /student_study_meds
  # GET /student_study_meds.json
  def index
    @student_study_meds = StudentStudyMed.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_study_meds }
    end
  end

  # GET /student_study_meds/1
  # GET /student_study_meds/1.json
  def show
    @student_study_med = StudentStudyMed.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_study_med }
    end
  end

  # GET /student_study_meds/new
  # GET /student_study_meds/new.json
  def new
    @student_study_med = StudentStudyMed.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_study_med }
    end
  end

  # GET /student_study_meds/1/edit
  def edit
    @student_study_med = StudentStudyMed.find(params[:id])
  end

  # POST /student_study_meds
  # POST /student_study_meds.json
  def create
    @student_study_med = StudentStudyMed.new(params[:student_study_med])

    respond_to do |format|
      if @student_study_med.save
        format.html { redirect_to @student_study_med, notice: 'Student study med was successfully created.' }
        format.json { render json: @student_study_med, status: :created, location: @student_study_med }
      else
        format.html { render action: "new" }
        format.json { render json: @student_study_med.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_study_meds/1
  # PUT /student_study_meds/1.json
  def update
    @student_study_med = StudentStudyMed.find(params[:id])

    respond_to do |format|
      if @student_study_med.update_attributes(params[:student_study_med])
        format.html { redirect_to @student_study_med, notice: 'Student study med was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_study_med.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_study_meds/1
  # DELETE /student_study_meds/1.json
  def destroy
    @student_study_med = StudentStudyMed.find(params[:id])
    @student_study_med.destroy

    respond_to do |format|
      format.html { redirect_to student_study_meds_url }
      format.json { head :ok }
    end
  end
end
