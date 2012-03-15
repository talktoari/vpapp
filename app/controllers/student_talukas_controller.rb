class StudentTalukasController < ApplicationController
  # GET /student_talukas
  # GET /student_talukas.json
  def index
    @student_talukas = StudentTaluka.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_talukas }
    end
  end

  # GET /student_talukas/1
  # GET /student_talukas/1.json
  def show
    @student_taluka = StudentTaluka.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_taluka }
    end
  end

  # GET /student_talukas/new
  # GET /student_talukas/new.json
  def new
    @student_taluka = StudentTaluka.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_taluka }
    end
  end

  # GET /student_talukas/1/edit
  def edit
    @student_taluka = StudentTaluka.find(params[:id])
  end

  # POST /student_talukas
  # POST /student_talukas.json
  def create
    @student_taluka = StudentTaluka.new(params[:student_taluka])

    respond_to do |format|
      if @student_taluka.save
        format.html { redirect_to @student_taluka, notice: 'Student taluka was successfully created.' }
        format.json { render json: @student_taluka, status: :created, location: @student_taluka }
      else
        format.html { render action: "new" }
        format.json { render json: @student_taluka.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_talukas/1
  # PUT /student_talukas/1.json
  def update
    @student_taluka = StudentTaluka.find(params[:id])

    respond_to do |format|
      if @student_taluka.update_attributes(params[:student_taluka])
        format.html { redirect_to @student_taluka, notice: 'Student taluka was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_taluka.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_talukas/1
  # DELETE /student_talukas/1.json
  def destroy
    @student_taluka = StudentTaluka.find(params[:id])
    @student_taluka.destroy

    respond_to do |format|
      format.html { redirect_to student_talukas_url }
      format.json { head :ok }
    end
  end
end
