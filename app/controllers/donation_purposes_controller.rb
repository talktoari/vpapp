class DonationPurposesController < ApplicationController
  # GET /donation_purposes
  # GET /donation_purposes.json
  def index
    @donation_purposes = DonationPurpose.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donation_purposes }
    end
  end

  # GET /donation_purposes/1
  # GET /donation_purposes/1.json
  def show
    @donation_purpose = DonationPurpose.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @donation_purpose }
    end
  end

  # GET /donation_purposes/new
  # GET /donation_purposes/new.json
  def new
    @donation_purpose = DonationPurpose.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @donation_purpose }
    end
  end

  # GET /donation_purposes/1/edit
  def edit
    @donation_purpose = DonationPurpose.find(params[:id])
  end

  # POST /donation_purposes
  # POST /donation_purposes.json
  def create
    @donation_purpose = DonationPurpose.new(params[:donation_purpose])

    respond_to do |format|
      if @donation_purpose.save
        format.html { redirect_to @donation_purpose, notice: 'Donation purpose was successfully created.' }
        format.json { render json: @donation_purpose, status: :created, location: @donation_purpose }
      else
        format.html { render action: "new" }
        format.json { render json: @donation_purpose.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /donation_purposes/1
  # PUT /donation_purposes/1.json
  def update
    @donation_purpose = DonationPurpose.find(params[:id])

    respond_to do |format|
      if @donation_purpose.update_attributes(params[:donation_purpose])
        format.html { redirect_to @donation_purpose, notice: 'Donation purpose was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @donation_purpose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donation_purposes/1
  # DELETE /donation_purposes/1.json
  def destroy
    @donation_purpose = DonationPurpose.find(params[:id])
    @donation_purpose.destroy

    respond_to do |format|
      format.html { redirect_to donation_purposes_url }
      format.json { head :ok }
    end
  end
end
