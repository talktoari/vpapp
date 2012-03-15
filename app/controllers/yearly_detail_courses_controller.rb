class YearlyDetailCoursesController < ApplicationController
  # GET /yearly_detail_courses
  # GET /yearly_detail_courses.json
  def index
    @yearly_detail_courses = YearlyDetailCourse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @yearly_detail_courses }
    end
  end

  # GET /yearly_detail_courses/1
  # GET /yearly_detail_courses/1.json
  def show
    @yearly_detail_course = YearlyDetailCourse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @yearly_detail_course }
    end
  end

  # GET /yearly_detail_courses/new
  # GET /yearly_detail_courses/new.json
  def new
    @yearly_detail_course = YearlyDetailCourse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @yearly_detail_course }
    end
  end

  # GET /yearly_detail_courses/1/edit
  def edit
    @yearly_detail_course = YearlyDetailCourse.find(params[:id])
  end

  # POST /yearly_detail_courses
  # POST /yearly_detail_courses.json
  def create
    @yearly_detail_course = YearlyDetailCourse.new(params[:yearly_detail_course])

    respond_to do |format|
      if @yearly_detail_course.save
        format.html { redirect_to @yearly_detail_course, notice: 'Yearly detail course was successfully created.' }
        format.json { render json: @yearly_detail_course, status: :created, location: @yearly_detail_course }
      else
        format.html { render action: "new" }
        format.json { render json: @yearly_detail_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /yearly_detail_courses/1
  # PUT /yearly_detail_courses/1.json
  def update
    @yearly_detail_course = YearlyDetailCourse.find(params[:id])

    respond_to do |format|
      if @yearly_detail_course.update_attributes(params[:yearly_detail_course])
        format.html { redirect_to @yearly_detail_course, notice: 'Yearly detail course was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @yearly_detail_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yearly_detail_courses/1
  # DELETE /yearly_detail_courses/1.json
  def destroy
    @yearly_detail_course = YearlyDetailCourse.find(params[:id])
    @yearly_detail_course.destroy

    respond_to do |format|
      format.html { redirect_to yearly_detail_courses_url }
      format.json { head :ok }
    end
  end
end
