class StudentDonationLinksController < ApplicationController
  # GET /student_donation_links
  # GET /student_donation_links.json
  def index
    @student_donation_links = StudentDonationLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_donation_links }
    end
  end

  # GET /student_donation_links/1
  # GET /student_donation_links/1.json
  def show
    @student_donation_link = StudentDonationLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_donation_link }
    end
  end

  # GET /student_donation_links/new
  # GET /student_donation_links/new.json
  def new
    @student_donation_link = StudentDonationLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_donation_link }
    end
  end

  # GET /student_donation_links/1/edit
  def edit
    @student_donation_link = StudentDonationLink.find(params[:id])
  end

  # POST /student_donation_links
  # POST /student_donation_links.json
  def create
    @student_donation_link = StudentDonationLink.new(params[:student_donation_link])

    respond_to do |format|
      if @student_donation_link.save
        format.html { redirect_to student_donation_links_path, notice: 'Student donation link was successfully created.' }
        format.json { render json: student_donation_links_path, status: :created, location: @student_donation_link }
      else
        format.html { render action: "new" }
        format.json { render json: @student_donation_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_donation_links/1
  # PUT /student_donation_links/1.json
  def update
    @student_donation_link = StudentDonationLink.find(params[:id])

    respond_to do |format|
      if @student_donation_link.update_attributes(params[:student_donation_link])
        format.html { redirect_to @student_donation_link, notice: 'Student donation link was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_donation_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_donation_links/1
  # DELETE /student_donation_links/1.json
  def destroy
    @student_donation_link = StudentDonationLink.find(params[:id])
    @student_donation_link.destroy

    respond_to do |format|
      format.html { redirect_to student_donation_links_url }
      format.json { head :ok }
    end
  end
end

