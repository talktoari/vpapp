class DonationsController < ApplicationController
  # CanCan Specific Authorization. Doesn't need instance variables
  # See all first line for actions commented except index
  load_and_authorize_resource
  before_filter :authenticate_user!

  # GET /donations
  # GET /donations.json
  def index
  # @donations = Donation.all
    @donations = Donation.order(:created_at).page params[:page]
    @all_donations = Donation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donations }
      format.xls {
              send_data @all_donations.to_xls(:name => "Donations",
              # :columns => [:name, :address, :age],
              # :headers => ['NAME', 'ADDRESS', 'AGE'],
              :cell_format => {:color => :blue},
              :header_format => {:weight => :bold, :color => :red}),
              :filename => 'All_Donations.xls' }
    end
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
  #  @donation = Donation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @donation }
    end
  end

  # GET /donations/new
  # GET /donations/new.json
  def new
  #  @donation = Donation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @donation }
    end
  end

  # GET /donations/1/edit
  def edit
  #  @donation = Donation.find(params[:id])
  end

  # POST /donations
  # POST /donations.json
  def create
  #  @donation = Donation.new(params[:donation])

    respond_to do |format|
      if @donation.save
        # Find the donor to redirect to donor show page
        @donor = Donor.find(@donation.donor_id)
        format.html { redirect_to donor_path(@donor), notice: 'Donation was successfully created.' }
        format.json { render json: @donation, status: :created, location: @donation }
      else
        format.html { render action: "new" }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /donations/1
  # PUT /donations/1.json
  def update
  #  @donation = Donation.find(params[:id])

    respond_to do |format|
      if @donation.update_attributes(params[:donation])
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
  #  @donation = Donation.find(params[:id])
    @donation.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
    end
  end

  # Search and Find relevant records based on query
  # Implemented using ransack gem
  # Before calling the form page, new object of Ransack::Search
  # for specific model needs to be created
  def search
    @search = Ransack::Search.new(Donation)
  end

  # Search Results
  def search_results
    @search = Donation.search(params[:q])
    @donations = @search.result(:distinct => true)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donations }
      format.xls {
              send_data @donations.to_xls(:name => "Found_Donations",
              # :columns => [:name, :address, :age],
              # :headers => ['NAME', 'ADDRESS', 'AGE'],
              :cell_format => {:color => :blue},
              :header_format => {:weight => :bold, :color => :red}),
              :filename => 'Found_Donations.xls' }
    end
  end

end

