class StudentParentOccupationsController < ApplicationController
  # CanCan Specific Authorization. Doesn't need instance variables
  # See all first line for actions commented except index
  load_and_authorize_resource
  before_filter :authenticate_user!

  # GET /student_parent_occupations
  # GET /student_parent_occupations.json
  def index
  #  @student_parent_occupations = StudentParentOccupation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_parent_occupations }
    end
  end

  # GET /student_parent_occupations/1
  # GET /student_parent_occupations/1.json
  def show
  #  @student_parent_occupation = StudentParentOccupation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_parent_occupation }
    end
  end

  # GET /student_parent_occupations/new
  # GET /student_parent_occupations/new.json
  def new
  #  @student_parent_occupation = StudentParentOccupation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_parent_occupation }
    end
  end

  # GET /student_parent_occupations/1/edit
  def edit
  #  @student_parent_occupation = StudentParentOccupation.find(params[:id])
  end

  # POST /student_parent_occupations
  # POST /student_parent_occupations.json
  def create
  #  @student_parent_occupation = StudentParentOccupation.new(params[:student_parent_occupation])

    respond_to do |format|
      if @student_parent_occupation.save
        format.html { redirect_to @student_parent_occupation, notice: 'Student parent occupation was successfully created.' }
        format.json { render json: @student_parent_occupation, status: :created, location: @student_parent_occupation }
      else
        format.html { render action: "new" }
        format.json { render json: @student_parent_occupation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_parent_occupations/1
  # PUT /student_parent_occupations/1.json
  def update
  #  @student_parent_occupation = StudentParentOccupation.find(params[:id])

    respond_to do |format|
      if @student_parent_occupation.update_attributes(params[:student_parent_occupation])
        format.html { redirect_to @student_parent_occupation, notice: 'Student parent occupation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_parent_occupation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_parent_occupations/1
  # DELETE /student_parent_occupations/1.json
  def destroy
  #  @student_parent_occupation = StudentParentOccupation.find(params[:id])
    @student_parent_occupation.destroy

    respond_to do |format|
      format.html { redirect_to student_parent_occupations_url }
      format.json { head :ok }
    end
  end
end

