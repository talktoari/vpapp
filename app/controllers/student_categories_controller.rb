class StudentCategoriesController < ApplicationController
  # CanCan Specific Authorization. Doesn't need instance variables
  # See all first line for actions commented except index
  load_and_authorize_resource
  before_filter :authenticate_user!

  # GET /student_categories
  # GET /student_categories.json
  def index
  #  @student_categories = StudentCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_categories }
    end
  end

  # GET /student_categories/1
  # GET /student_categories/1.json
  def show
  #  @student_category = StudentCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_category }
    end
  end

  # GET /student_categories/new
  # GET /student_categories/new.json
  def new
  #  @student_category = StudentCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_category }
    end
  end

  # GET /student_categories/1/edit
  def edit
  #  @student_category = StudentCategory.find(params[:id])
  end

  # POST /student_categories
  # POST /student_categories.json
  def create
  #  @student_category = StudentCategory.new(params[:student_category])

    respond_to do |format|
      if @student_category.save
        format.html { redirect_to @student_category, notice: 'Student category was successfully created.' }
        format.json { render json: @student_category, status: :created, location: @student_category }
      else
        format.html { render action: "new" }
        format.json { render json: @student_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_categories/1
  # PUT /student_categories/1.json
  def update
  #  @student_category = StudentCategory.find(params[:id])

    respond_to do |format|
      if @student_category.update_attributes(params[:student_category])
        format.html { redirect_to @student_category, notice: 'Student category was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_categories/1
  # DELETE /student_categories/1.json
  def destroy
  #  @student_category = StudentCategory.find(params[:id])
    @student_category.destroy

    respond_to do |format|
      format.html { redirect_to student_categories_url }
      format.json { head :ok }
    end
  end
end

