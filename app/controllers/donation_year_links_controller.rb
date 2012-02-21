class DonationYearLinksController < ApplicationController
  # GET /donation_year_links
  # GET /donation_year_links.json
  def index
    @donation_year_links = DonationYearLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donation_year_links }
    end
  end

  # GET /donation_year_links/1
  # GET /donation_year_links/1.json
  def show
    @donation_year_link = DonationYearLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @donation_year_link }
    end
  end

  # GET /donation_year_links/new
  # GET /donation_year_links/new.json
  def new
    @donation_year_link = DonationYearLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @donation_year_link }
    end
  end

  # GET /donation_year_links/1/edit
  def edit
    @donation_year_link = DonationYearLink.find(params[:id])
  end

  # POST /donation_year_links
  # POST /donation_year_links.json
  def create
    @donation_year_link = DonationYearLink.new(params[:donation_year_link])

    respond_to do |format|
      if @donation_year_link.save
        format.html { redirect_to @donation_year_link, notice: 'Donation year link was successfully created.' }
        format.json { render json: @donation_year_link, status: :created, location: @donation_year_link }
      else
        format.html { render action: "new" }
        format.json { render json: @donation_year_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /donation_year_links/1
  # PUT /donation_year_links/1.json
  def update
    @donation_year_link = DonationYearLink.find(params[:id])

    respond_to do |format|
      if @donation_year_link.update_attributes(params[:donation_year_link])
        format.html { redirect_to @donation_year_link, notice: 'Donation year link was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @donation_year_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donation_year_links/1
  # DELETE /donation_year_links/1.json
  def destroy
    @donation_year_link = DonationYearLink.find(params[:id])
    @donation_year_link.destroy

    respond_to do |format|
      format.html { redirect_to donation_year_links_url }
      format.json { head :ok }
    end
  end
end
