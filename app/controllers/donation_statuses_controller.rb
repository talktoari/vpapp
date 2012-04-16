class DonationStatusesController < ApplicationController
  # CanCan Specific Authorization. Doesn't need instance variables
  # See all first line for actions commented except index
  load_and_authorize_resource
  before_filter :authenticate_user!

  # GET /donation_statuses
  # GET /donation_statuses.json
  def index
  #  @donation_statuses = DonationStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donation_statuses }
    end
  end

  # GET /donation_statuses/1
  # GET /donation_statuses/1.json
  def show
  #  @donation_status = DonationStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @donation_status }
    end
  end

  # GET /donation_statuses/new
  # GET /donation_statuses/new.json
  def new
  #  @donation_status = DonationStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @donation_status }
    end
  end

  # GET /donation_statuses/1/edit
  def edit
  #  @donation_status = DonationStatus.find(params[:id])
  end

  # POST /donation_statuses
  # POST /donation_statuses.json
  def create
  #  @donation_status = DonationStatus.new(params[:donation_status])

    respond_to do |format|
      if @donation_status.save
        format.html { redirect_to @donation_status, notice: 'Donation status was successfully created.' }
        format.json { render json: @donation_status, status: :created, location: @donation_status }
      else
        format.html { render action: "new" }
        format.json { render json: @donation_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /donation_statuses/1
  # PUT /donation_statuses/1.json
  def update
  #  @donation_status = DonationStatus.find(params[:id])

    respond_to do |format|
      if @donation_status.update_attributes(params[:donation_status])
        format.html { redirect_to @donation_status, notice: 'Donation status was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @donation_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donation_statuses/1
  # DELETE /donation_statuses/1.json
  def destroy
  #  @donation_status = DonationStatus.find(params[:id])
    @donation_status.destroy

    respond_to do |format|
      format.html { redirect_to donation_statuses_url }
      format.json { head :ok }
    end
  end
end

