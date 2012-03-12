class DonorTitlesController < ApplicationController
  # GET /donor_titles
  # GET /donor_titles.json
  def index
    @donor_titles = DonorTitle.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donor_titles }
    end
  end

  # GET /donor_titles/1
  # GET /donor_titles/1.json
  def show
    @donor_title = DonorTitle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @donor_title }
    end
  end

  # GET /donor_titles/new
  # GET /donor_titles/new.json
  def new
    @donor_title = DonorTitle.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @donor_title }
    end
  end

  # GET /donor_titles/1/edit
  def edit
    @donor_title = DonorTitle.find(params[:id])
  end

  # POST /donor_titles
  # POST /donor_titles.json
  def create
    @donor_title = DonorTitle.new(params[:donor_title])

    respond_to do |format|
      if @donor_title.save
        format.html { redirect_to @donor_title, notice: 'Donor title was successfully created.' }
        format.json { render json: @donor_title, status: :created, location: @donor_title }
      else
        format.html { render action: "new" }
        format.json { render json: @donor_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /donor_titles/1
  # PUT /donor_titles/1.json
  def update
    @donor_title = DonorTitle.find(params[:id])

    respond_to do |format|
      if @donor_title.update_attributes(params[:donor_title])
        format.html { redirect_to @donor_title, notice: 'Donor title was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @donor_title.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donor_titles/1
  # DELETE /donor_titles/1.json
  def destroy
    @donor_title = DonorTitle.find(params[:id])
    @donor_title.destroy

    respond_to do |format|
      format.html { redirect_to donor_titles_url }
      format.json { head :ok }
    end
  end
end
