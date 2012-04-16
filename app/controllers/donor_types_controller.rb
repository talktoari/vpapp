class DonorTypesController < ApplicationController
  # CanCan Specific Authorization. Doesn't need instance variables
  # See all first line for actions commented except index
  load_and_authorize_resource
  before_filter :authenticate_user!

  # GET /donor_types
  # GET /donor_types.json
  def index
  #  @donor_types = DonorType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @donor_types }
    end
  end

  # GET /donor_types/1
  # GET /donor_types/1.json
  def show
  #  @donor_type = DonorType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @donor_type }
    end
  end

  # GET /donor_types/new
  # GET /donor_types/new.json
  def new
  #  @donor_type = DonorType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @donor_type }
    end
  end

  # GET /donor_types/1/edit
  def edit
  #  @donor_type = DonorType.find(params[:id])
  end

  # POST /donor_types
  # POST /donor_types.json
  def create
  #  @donor_type = DonorType.new(params[:donor_type])

    respond_to do |format|
      if @donor_type.save
        format.html { redirect_to @donor_type, notice: 'Donor type was successfully created.' }
        format.json { render json: @donor_type, status: :created, location: @donor_type }
      else
        format.html { render action: "new" }
        format.json { render json: @donor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /donor_types/1
  # PUT /donor_types/1.json
  def update
  #  @donor_type = DonorType.find(params[:id])

    respond_to do |format|
      if @donor_type.update_attributes(params[:donor_type])
        format.html { redirect_to @donor_type, notice: 'Donor type was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @donor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donor_types/1
  # DELETE /donor_types/1.json
  def destroy
  #  @donor_type = DonorType.find(params[:id])
    @donor_type.destroy

    respond_to do |format|
      format.html { redirect_to donor_types_url }
      format.json { head :ok }
    end
  end
end

